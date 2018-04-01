//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Proiect_Colectiv.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class medicalRecord
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public medicalRecord()
        {
            this.Patients = new HashSet<Patient>();
        }
        [Key]
        public int idmedicalRecords { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public string vaccinations { get; set; }
        public string diseases { get; set; }
        public string previousDiseases { get; set; }
        public string meds { get; set; }
        public string allergies { get; set; }
        public string lastControl { get; set; }
        public string info { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Patient> Patients { get; set; }
    }
}
