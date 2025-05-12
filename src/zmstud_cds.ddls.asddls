@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for student'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@OData.hierarchy.recursiveHierarchy:[{ entity.name: 'ZMSTUD_hry' }]
define root view entity ZMSTUD_cds as select from zmstud_t
association of many to one ZMSTUD_cds as _Mentor on $projection.Mentor = _Mentor.Studentid
composition[1..*] of ZMEXAM_CDS as _exams 

{
    key studentid as Studentid,
    firstname as Firstname,
    lastname as Lastname,
    class as Class,
    gender as Gender,
    mentor as Mentor,
    _Mentor,
    _exams
}
