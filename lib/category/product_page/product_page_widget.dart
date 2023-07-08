import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_page_model.dart';
export 'product_page_model.dart';

class ProductPageWidget extends StatefulWidget {
  const ProductPageWidget({
    Key? key,
    this.subCategoryRef,
  }) : super(key: key);

  final DocumentReference? subCategoryRef;

  @override
  _ProductPageWidgetState createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  late ProductPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ProductPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PRODUCT_ProductPage_ON_INIT_STATE');
      logFirebaseEvent('ProductPage_show_snack_bar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.subCategoryRef!.id,
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            valueOrDefault<String>(
              widget.subCategoryRef?.id,
              'Product',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<FavoriteProductRecord>>(
            stream: queryFavoriteProductRecord(
              queryBuilder: (favoriteProductRecord) => favoriteProductRecord
                  .where('userId', isEqualTo: currentUserUid),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                );
              }
              List<FavoriteProductRecord> columnFavoriteProductRecordList =
                  snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(columnFavoriteProductRecordList.length,
                    (columnIndex) {
                  final columnFavoriteProductRecord =
                      columnFavoriteProductRecordList[columnIndex];
                  return StreamBuilder<List<ProductRecord>>(
                    stream: queryProductRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        );
                      }
                      List<ProductRecord> listViewProductRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewProductRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewProductRecord =
                              listViewProductRecordList[listViewIndex];
                          return Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2.0,
                                        color: Color(0x520E151B),
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PRODUCT_PAGE_PAGE_Stack_yk2v95bf_ON_TAP');
                                      logFirebaseEvent('Stack_navigate_to');

                                      context.pushNamed(
                                        'ProductDetailPage',
                                        queryParameters: {
                                          'productRef': serializeParam(
                                            listViewProductRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.network(
                                                    listViewProductRecord
                                                        .imageUrl,
                                                    width: double.infinity,
                                                    height: 260.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        listViewProductRecord
                                                            .name,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge,
                                                      ),
                                                      Text(
                                                        listViewProductRecord
                                                            .price
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    listViewProductRecord
                                                        .description,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.98, -1.0),
                                          child: ToggleIcon(
                                            onPressed: () async {
                                              final savedByElement =
                                                  currentUserUid;
                                              final savedByUpdate =
                                                  listViewProductRecord.savedBy
                                                          .contains(
                                                              savedByElement)
                                                      ? FieldValue.arrayRemove(
                                                          [savedByElement])
                                                      : FieldValue.arrayUnion(
                                                          [savedByElement]);
                                              await listViewProductRecord
                                                  .reference
                                                  .update({
                                                'savedBy': savedByUpdate,
                                              });
                                              logFirebaseEvent(
                                                  'PRODUCT_ToggleIcon_ewzuxefb_ON_TOGGLE');
                                              if (loggedIn) {
                                                // get The Product Id
                                                logFirebaseEvent(
                                                    'ToggleIcon_update_app_state');
                                                setState(() {
                                                  FFAppState().favoriteProd =
                                                      listViewProductRecord
                                                          .reference;
                                                });
                                                if (listViewProductRecord
                                                    .savedBy
                                                    .contains(currentUserUid)) {
                                                  logFirebaseEvent(
                                                      'ToggleIcon_backend_call');

                                                  await listViewProductRecord
                                                      .reference
                                                      .update({
                                                    'savedBy':
                                                        FieldValue.arrayRemove(
                                                            [currentUserUid]),
                                                  });
                                                  logFirebaseEvent(
                                                      'ToggleIcon_backend_call');
                                                  await FFAppState()
                                                      .favoriteProd!
                                                      .delete();
                                                  return;
                                                } else {
                                                  logFirebaseEvent(
                                                      'ToggleIcon_backend_call');

                                                  await listViewProductRecord
                                                      .reference
                                                      .update({
                                                    'savedBy':
                                                        FieldValue.arrayUnion(
                                                            [currentUserUid]),
                                                  });
                                                  logFirebaseEvent(
                                                      'ToggleIcon_backend_call');

                                                  await FavoriteProductRecord
                                                      .collection
                                                      .doc()
                                                      .set({
                                                    ...createFavoriteProductRecordData(
                                                      userId: currentUserUid,
                                                      productRef:
                                                          listViewProductRecord
                                                              .reference,
                                                    ),
                                                    'creationDate': FieldValue
                                                        .serverTimestamp(),
                                                  });
                                                  return;
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'ToggleIcon_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Connect You First',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                                return;
                                              }
                                            },
                                            value: listViewProductRecord.savedBy
                                                .contains(currentUserUid),
                                            onIcon: Icon(
                                              Icons.favorite,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 25.0,
                                            ),
                                            offIcon: Icon(
                                              Icons.favorite_border,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 25.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
