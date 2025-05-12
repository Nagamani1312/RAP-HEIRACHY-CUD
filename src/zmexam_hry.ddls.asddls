define hierarchy ZMEXAM_HRY
with parameters
    p_studid : abap.int1
  as parent child hierarchy (
    source ZMEXAM_CDS
    child to parent association _parent
    directory _student filter by
      Studentid = $parameters.p_studid
    start where Parentid is initial
    siblings order by SiblingOrderNumber ascending
  )
{
   key Studentid,
    key Examid,
    Parentid,
    SiblingOrderNumber
    
    
}
