const List<Map<String, dynamic>> health_overview_ques = [
  {
    "imageUrl": "https://example.com/image1.png",
    "ques": "Have any pre-existng disease?",
    "ans":
        "Such as diabetes, High BP, heart disease, HIV, genetic and psychiatric disorders, cancer or other diseases."
  },
  {
    "imageUrl": "https://example.com/image2.png",
    "ques": "Has any medical history?",
    "ans": "I take medication for high cholesterol and occasional pain relief."
  },
  {
    "imageUrl": "https://example.com/image4.png",
    "ques": "Been conditionally issue or declined health / life insurance?",
    "ans": "Conditions such as exclusions, postponement  or loading."
  },
  {
    "imageUrl": "https://example.com/image5.png",
    "ques": "Smokes, consumes alcohol or any tobacco products?",
    "ans": ""
  },
];

const List<Map<String, dynamic>> disease = [
  {"imagery": "https://example.com/images/disease2.jpg", "disease": "Diabetes"},
  {"imagery": "https://example.com/images/disease3.jpg", "disease": "High BP"},
  {"imagery": "https://example.com/images/disease4.jpg", "disease": "HIV/Aids"},
  {
    "imagery": "https://example.com/images/disease5.jpg",
    "disease": "Genetic \nDiseases"
  },
  {
    "imagery": "https://example.com/images/disease6.jpg",
    "disease": "Heart \nDiseases"
  },
  {
    "imagery": "https://example.com/images/disease7.jpg",
    "disease": "Psychiatric \nDisorders"
  },
  {
    "imagery": "https://example.com/images/disease8.jpg",
    "disease": "Cancer \nTumor"
  },
  {"imagery": "https://example.com/images/disease9.jpg", "disease": "Stroke"},
  {"imagery": "https://example.com/images/disease10.jpg", "disease": "Thyroid"},
  {
    "imagery": "https://example.com/images/disease11.jpg",
    "disease": "Kidney \nStones"
  },
  {
    "imagery": "https://example.com/images/disease12.jpg",
    "disease": "High \nCholesterol"
  },
  {"imagery": "https://example.com/images/disease1.jpg", "disease": "Others"},
];

const medicalHistory = [
  "Hospitalization for more than 5 days",
  "Surgical procedures",
  "Symptoms for more than 14 days",
  "Regular medication",
  "Detection of adverse results for health tests"
];

const List<Map<String, dynamic>> substance = [
  {
    "title": "Alcohol",
    "subtitle": "Select the quantity per week(1peg = 30ml)",
    "options": ["< 5 pegs", "> 5 pegs", "Daily Drinker"]
  },
  {
    "title": "Chewable Tobacco",
    "subtitle": "Select the quantity consumed per week",
    "options": ["< 5 packets", ">= 10 packets"]
  },
  {
    "title": "Cigarettes",
    "subtitle": "Select the quantity consumned per week",
    "options": ["< 10 cigarettes", ">= 10 cigarettes"]
  }
];
