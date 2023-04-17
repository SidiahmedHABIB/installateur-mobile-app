import 'dart:io';
import 'package:flutter/services.dart';
import 'package:installateur/presentation/report_helper/utils.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import '../../domain/model/installation_report.dart';
import 'report_helper.dart';

class ReportGenerator {
  static Future<File> generate(
      String reportName, InstallationReport report) async {
    final pdf = Document();
    Uint8List logo = await getLogo();
    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(report, logo),
        SizedBox(height: 3 * PdfPageFormat.cm),
        buildTitle(report),
        buildInvoice(report),
      ],
      footer: (context) => buildFooter(report),
    ));

    return ReportHelper.saveDocument(name: '$reportName.pdf', pdf: pdf);
  }

  static Future<Uint8List> getLogo() async {
    return (await rootBundle.load(AssetsManager.navBarStrada))
        .buffer
        .asUint8List();
  }

  static Widget buildHeader(InstallationReport? report, Uint8List logo) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildTechnicalAddress(report!.technical!),
              Container(width: 100, child: pw.Image(pw.MemoryImage(logo))),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCompanyAddress(report.companyReport!),
              buildInvoiceInfo(report.info!),
            ],
          ),
        ],
      );

  static Widget buildCompanyAddress(CompanyReport? companyReport) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(companyReport!.name!,
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(companyReport.address!),
        ],
      );

  static Widget buildInvoiceInfo(InstallationInfo info) {
    final titles = <String>[
      'Report Date:',
    ];
    final data = <String>[
      Utils.formatDate(info.date!),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value, width: 150);
      }),
    );
  }

  static Widget buildTechnicalAddress(Technical? technical) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(technical!.name!, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(technical.address!),
        ],
      );

  static Widget buildTitle(InstallationReport? report) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Installation Report',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Text(report!.info!.description!),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildInvoice(InstallationReport report) {
    final headers = [
      'Name',
      'Installed',
      'Entity',
      'Registration',
      'Value',
      'Nserial'
    ];
    final data = report.box!.map((box) {
      return [
        box.name.toString(),
        Utils.formatDate(DateTime.now()).toString(),
        box.entity.toString(),
        box.matricul.toString(),
        box.value.toString(),
        box.sNumber.toString(),
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: const BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
      },
    );
  }

  static Widget buildFooter(InstallationReport report) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(title: 'Address', value: "Nouakchott, Mauritania"),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(
              title: 'Contact', value: "https://www.stradaworld.com"),
        ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
