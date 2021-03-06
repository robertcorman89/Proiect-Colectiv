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
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class Appointment
    {

        [Key]
        [Column(Order = 1)]
        public int idMedic { get; set; }

        [Key]
        [Column(Order = 2)]
        [Display(Name = "Card number")]
        [RegularExpression("[0-9]{13,13}", ErrorMessage = "Card number must contain 13 digits!")]
        [Required]
        public string cardNumber { get; set; }

        [Display(Name = "Appointment date")]
        [Required]
        public Nullable<System.DateTime> Date { get; set; }

        [Display(Name = "Appointment time")]
        [Required]
        public Nullable<System.TimeSpan> Time { get; set; }

        public Nullable<int> idmedicalPrescription { get; set; }
    
        public virtual Patient Patient { get; set; }
        public virtual Medic Medic { get; set; }
        public virtual medicalPrescription medicalPrescription { get; set; }
    }
}
