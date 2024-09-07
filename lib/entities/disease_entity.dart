enum FaceDisease { good, bad, soso, crazy }

class Disease {
  final String disease;
  final int tipo;
  final FaceDisease face;

  Disease(this.disease, this.tipo, this.face);
}

final List<Disease> diseases = [
  // Enfermedades óseas
  Disease('Arthritis', 1, FaceDisease.soso),
  Disease('Osteoporosis', 1, FaceDisease.soso),
  Disease('Osteoarthritis', 1, FaceDisease.soso),
  Disease('Rickets', 1, FaceDisease.soso),
  Disease('Paget\'s disease', 1, FaceDisease.soso),
  Disease('Bone cancer', 1, FaceDisease.soso),
  Disease('Fibrous dysplasia', 1, FaceDisease.soso),
  Disease('Osteogenesis imperfecta', 1, FaceDisease.soso),
  Disease('Osteomyelitis', 1, FaceDisease.soso),
  Disease('Osteosarcoma', 1, FaceDisease.soso),

  // Variantes de cáncer
  Disease('Leukemia', 2, FaceDisease.bad),
  Disease('Colon cancer', 2, FaceDisease.bad),
  Disease('Lung cancer', 2, FaceDisease.bad),
  Disease('Breast cancer', 2, FaceDisease.bad),
  Disease('Prostate cancer', 2, FaceDisease.bad),
  Disease('Pancreatic cancer', 2, FaceDisease.bad),
  Disease('Skin cancer (melanoma)', 2, FaceDisease.bad),
  Disease('Bladder cancer', 2, FaceDisease.bad),
  Disease('Liver cancer', 2, FaceDisease.bad),
  Disease('Thyroid cancer', 2, FaceDisease.bad),
  Disease('Esophageal cancer', 2, FaceDisease.bad),
  Disease('Cervical cancer', 2, FaceDisease.bad),

  // Enfermedades respiratorias
  Disease('Asthma', 3, FaceDisease.bad),
  Disease('Chronic obstructive pulmonary disease (COPD)', 3, FaceDisease.bad),
  Disease('Bronchitis', 3, FaceDisease.bad),
  Disease('Pneumonia', 3, FaceDisease.bad),
  Disease('Emphysema', 3, FaceDisease.bad),
  Disease('Lung fibrosis', 3, FaceDisease.bad),
  Disease('Tuberculosis', 3, FaceDisease.bad),

  // Trastornos mentales
  Disease('Autism', 4, FaceDisease.crazy),
  Disease('Schizophrenia', 4, FaceDisease.crazy),
  Disease('Bipolar disorder', 4, FaceDisease.crazy),
  Disease('Depression', 4, FaceDisease.crazy),
  Disease('Anxiety disorder', 4, FaceDisease.crazy),
];
