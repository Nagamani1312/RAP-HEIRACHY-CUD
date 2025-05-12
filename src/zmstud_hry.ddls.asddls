define hierarchy ZMSTUD_hry
  as parent child hierarchy (
    source ZMSTUD_cds
    child to parent association _Mentor
    start where Mentor is initial
    siblings order by Lastname
  )
{
    key Studentid,
    Mentor
    
    
}
