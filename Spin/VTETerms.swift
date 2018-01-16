//
//  VTETerms.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation

class VTETerms {
    var terms : [VTETerm] = []
    
    init() {
        terms.append(VTETerm(term: "Previous VTE (except a single event related to major surgery)",
                             score: 4, color: AppColors.redVTE, "ic_vte_term1"))
        
        terms.append(VTETerm(term: "Previous VTE provoked by major surgery", score: 3,
                             color: AppColors.orangeVTE, "ic_vte_term2"))
        
        terms.append(VTETerm(term: "Known high-risk thrombophilia", score: 3, color: AppColors.orangeVTE, "ic_vte_term3"))
        
        terms.append(VTETerm(term: "Medical comorbidities e.g. cancer, heart failure; active systemic lupus erythematosus, inflammatory polyarthropathy or inflammatory bowel disease; nephrotic syndrome; type I diabetes mellitus with nephropathy; sickle cell disease; current intravenous drug user",
                             score: 3, color: AppColors.orangeVTE, "ic_vte_term4"))
        
        terms.append(VTETerm(term: "Family history of unprovoked or estrogen-related VTE in first-degree relative", score: 1, color: AppColors.yellowVTE, "ic_vte_term5"))
        
        terms.append(VTETerm(term: "Known low-risk thrombophilia (no VTE)", score: 1,
                             color: AppColors.yellowVTE, "ic_vte_term6"))
        
        terms.append(VTETerm(term: "Age (> 35 years)", score: 1, color: AppColors.yellowVTE, "ic_vte_term7"))
        terms.append(VTETerm(term: "Obesity: BMI >= 30", score: 1, color: AppColors.yellowVTE, "ic_vte_term8"))
        terms.append(VTETerm(term: "Obesity: BMI >= 40", score: 2, color: AppColors.orangeVTE, "ic_vte_term9"))
        terms.append(VTETerm(term: "Parity ≥ 3", score: 1, color: AppColors.yellowVTE, "ic_vte_term10"))
        terms.append(VTETerm(term: "Smoker", score: 1, color: AppColors.yellowVTE, "ic_vte_term11"))
        terms.append(VTETerm(term: "Gross varicose veins", score: 1, color: AppColors.yellowVTE, "ic_vte_term12"))
        terms.append(VTETerm(term: "Pre-eclampsia in current pregnancy", score: 1, color: AppColors.yellowVTE, "ic_vte_term13"))
        terms.append(VTETerm(term: "ART/IVF (antenatal only)", score: 1, color: AppColors.yellowVTE, "ic_vte_term14"))
        terms.append(VTETerm(term: "Multiple pregnancy", score: 1, color: AppColors.yellowVTE, "ic_vte_term15"))
        terms.append(VTETerm(term: "Caesarean section in labour", score: 2, color: AppColors.orangeVTE, "ic_vte_term16"))
        terms.append(VTETerm(term: "Elective caesarean section", score: 1, color: AppColors.yellowVTE, "ic_vte_term17"))
        
        terms.append(VTETerm(term: "Mid-cavity or rotational operative delivery", score: 1,
                             color: AppColors.yellowVTE, "ic_vte_term18"))
        
        terms.append(VTETerm(term: "Prolonged labour (> 24 hours)", score: 1, color: AppColors.yellowVTE, "ic_vte_term19"))
        terms.append(VTETerm(term: "PPH (> 1 litre or transfusion)", score: 1, color: AppColors.yellowVTE, "ic_vte_term20"))
        terms.append(VTETerm(term: "Preterm birth < 37+0 weeks in current pregnancy", score: 1,
                             color: AppColors.yellowVTE, "ic_vte_term21"))
        
        
        terms.append(VTETerm(term: "Stillbirth in current pregnancy", score: 1, color: AppColors.yellowVTE, "ic_vte_term22"))
        
        terms.append(VTETerm(term: "Any surgical procedure in pregnancy or puerperium except immediate repair of the perineum, e.g. appendicectomy, postpartum sterilisation", score: 3,
                             color: AppColors.orangeVTE, "ic_vte_term23"))
        
        terms.append(VTETerm(term: "Hyperemesis", score: 3, color: AppColors.orangeVTE, "ic_vte_term24"))
        terms.append(VTETerm(term: "OHSS (first trimester only)", score: 4, color: AppColors.redVTE, "ic_vte_term25"))
        terms.append(VTETerm(term: "Current systemic infection", score: 1, color: AppColors.yellowVTE, "ic_vte_term26"))
        terms.append(VTETerm(term: "Immobility, dehydration", score: 1, color: AppColors.yellowVTE, "ic_vte_term30"))
        
    }
}
