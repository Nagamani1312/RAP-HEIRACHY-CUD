@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for exams'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@OData.hierarchy.recursiveHierarchy:[{ entity.name: 'ZMexam_hry' }]
define view entity ZMEXAM_CDS as select from zmexam_t
association to parent ZMSTUD_cds as _student on $projection.Studentid = _student.Studentid

association of many to one ZMEXAM_CDS as _parent on $projection.Studentid = _parent.Studentid
                                                    and $projection.Parentid = _parent.Examid
association of many to many ZMEXAM_CDS as _exam on $projection.Studentid = _exam.Studentid
                                                    and $projection.Examid = _exam.Parentid
//association of many to one ZMEXAM_CDS as _parent on  $projection.Parentid = _parent.Examid                                                    

{
    key studentid as Studentid,
    key examid as Examid,
    subid as Subid,
    marks as Marks,
    status as Status,
    parentid as Parentid,
    sibling_order_number as SiblingOrderNumber,
    
    _student,
    _parent,
    _exam
}
