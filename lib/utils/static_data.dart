import 'package:ihwp/models/exercise_model.dart';
import 'package:ihwp/models/question_model.dart';

class StaticData {
  static List<Question> getQuestions() {
    return [
      Question(
        text: 'What is your body frame?',
        options: [
          QuestionOption(text: 'Light and thin, small-boned', prakruti: 'Vata'),
          QuestionOption(text: 'Medium build, muscular', prakruti: 'Pitta'),
          QuestionOption(text: 'Large build, heavy-boned', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'How is your skin?',
        options: [
          QuestionOption(text: 'Dry, thin, tans easily', prakruti: 'Vata'),
          QuestionOption(text: 'Oily, sensitive, reddish, burns easily', prakruti: 'Pitta'),
          QuestionOption(text: 'Thick, oily, pale, smooth', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'How is your hair?',
        options: [
          QuestionOption(text: 'Dry, thin, brittle', prakruti: 'Vata'),
          QuestionOption(text: 'Oily, fine, early graying/balding', prakruti: 'Pitta'),
          QuestionOption(text: 'Thick, oily, wavy, lustrous', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'What is your appetite like?',
        options: [
          QuestionOption(text: 'Irregular, variable', prakruti: 'Vata'),
          QuestionOption(text: 'Strong, sharp, get irritable if I miss a meal', prakruti: 'Pitta'),
          QuestionOption(text: 'Steady, but can skip meals easily', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'How is your digestion?',
        options: [
          QuestionOption(text: 'Irregular, prone to gas and bloating', prakruti: 'Vata'),
          QuestionOption(text: 'Strong, fast, prone to acidity', prakruti: 'Pitta'),
          QuestionOption(text: 'Slow, heavy, can feel sluggish after eating', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'What is your elimination (bowel) pattern?',
        options: [
          QuestionOption(text: 'Irregular, dry, hard stools, constipated', prakruti: 'Vata'),
          QuestionOption(text: 'Regular, loose stools, 2-3 times/day', prakruti: 'Pitta'),
          QuestionOption(text: 'Regular, but slow; heavy, thick stools', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'How is your body temperature?',
        options: [
          QuestionOption(text: 'Hands and feet are often cold', prakruti: 'Vata'),
          QuestionOption(text: 'Usually warm, prefer cool environments', prakruti: 'Pitta'),
          QuestionOption(text: 'Adaptable, but dislike cold, damp weather', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'How do you sleep?',
        options: [
          QuestionOption(text: 'Light, interrupted sleep, prone to insomnia', prakruti: 'Vata'),
          QuestionOption(text: 'Moderate, but can wake up feeling hot', prakruti: 'Pitta'),
          QuestionOption(text: 'Heavy, deep, long sleep; hard to wake up', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'What is your energy level like?',
        options: [
          QuestionOption(text: 'Comes in bursts, variable', prakruti: 'Vata'),
          QuestionOption(text: 'Strong, intense, focused', prakruti: 'Pitta'),
          QuestionOption(text: 'Steady, calm, good stamina', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'How do you react to stress?',
        options: [
          QuestionOption(text: 'With anxiety, fear, and worry', prakruti: 'Vata'),
          QuestionOption(text: 'With irritability, anger, and impatience', prakruti: 'Pitta'),
          QuestionOption(text: 'Withdrawing, feeling lethargic, or attached', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'How is your memory?',
        options: [
          QuestionOption(text: 'Quick to learn, quick to forget', prakruti: 'Vata'),
          QuestionOption(text: 'Sharp, focused, good recall', prakruti: 'Pitta'),
          QuestionOption(text: 'Slow to learn, but excellent long-term memory', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'What is your speech like?',
        options: [
          QuestionOption(text: 'Fast, talkative', prakruti: 'Vata'),
          QuestionOption(text: 'Sharp, clear, precise', prakruti: 'Pitta'),
          QuestionOption(text: 'Slow, melodic, soft', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'How is your emotional temperament?',
        options: [
          QuestionOption(text: 'Enthusiastic, lively, but moods change quickly', prakruti: 'Vata'),
          QuestionOption(text: 'Passionate, intense, ambitious, strong-willed', prakruti: 'Pitta'),
          QuestionOption(text: 'Calm, stable, patient, compassionate', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'What kind of weather do you dislike?',
        options: [
          QuestionOption(text: 'Cold, dry, and windy', prakruti: 'Vata'),
          QuestionOption(text: 'Hot and sunny', prakruti: 'Pitta'),
          QuestionOption(text: 'Cold, damp, and cloudy', prakruti: 'Kapha'),
        ],
      ),
      Question(
        text: 'How is your physical stamina?',
        options: [
          QuestionOption(text: 'Low, get tired easily', prakruti: 'Vata'),
          QuestionOption(text: 'Moderate, but competitive', prakruti: 'Pitta'),
          QuestionOption(text: 'High, very steady and enduring', prakruti: 'Kapha'),
        ],
      ),
    ];
  }
}

// --- Prakruti Descriptions ---
String getPrakrutiDescription(String prakruti) {
  switch (prakruti) {
    case 'Vata':
      return 'Vata is composed of Air and Ether. People with dominant Vata are typically energetic, creative, and lively. When out of balance, they may experience anxiety, insomnia, and dry skin. The key is to stay grounded, warm, and maintain a routine.';
    case 'Pitta':
      return 'Pitta is composed of Fire and Water. People with dominant Pitta are often intelligent, focused, and ambitious. When out of balance, they can become irritable, impatient, and suffer from acidity or inflammation. The key is to stay cool, moderate intensity, and avoid excess heat.';
    case 'Kapha':
      return 'Kapha is composed of Earth and Water. People with dominant Kapha are usually calm, stable, and compassionate. When out of balance, they may feel lethargic, gain weight easily, and suffer from congestion. The key is to stay active, stimulated, and eat light.';
    default:
      return 'Learn about your prakruti.';
  }
}

// --- Diet Data ---
Map<String, dynamic> getDietForPrakruti(String prakruti) {
  const vataFavor = [
    'Warm, cooked, and oily foods',
    'Sweet, sour, and salty tastes',
    'Ghee, sesame oil',
    'Cooked vegetables (carrots, asparagus, sweet potatoes)',
    'Rice, wheat',
    'Sweet fruits (bananas, avocados, mangoes, berries)',
    'Warm milk, herbal teas (ginger, licorice)',
  ];
  const vataReduce = [
    'Cold, dry, and raw foods (e.g., raw salads)',
    'Pungent, bitter, and astringent tastes',
    'Carbonated drinks, caffeine',
    'Dry fruits (in excess), apples, pears',
    'Cruciferous vegetables (broccoli, cabbage, cauliflower)',
  ];

  const pittaFavor = [
    'Cool, refreshing, and slightly dry foods',
    'Sweet, bitter, and astringent tastes',
    'Ghee, coconut oil, sunflower oil',
    'Sweet fruits (grapes, melons, coconut, mangoes)',
    'Cooling vegetables (cucumber, leafy greens, broccoli)',
    'Rice, barley, oats',
    'Cool milk, mint tea, coconut water',
  ];
  const pittaReduce = [
    'Hot, spicy, and oily foods',
    'Sour, salty, and pungent tastes',
    'Aged cheese, sour cream',
    'Sour fruits (oranges, pineapple, grapefruit)',
    'Pungent vegetables (onions, garlic, tomatoes)',
    'Caffeine, alcohol',
  ];

  const kaphaFavor = [
    'Warm, light, and dry foods',
    'Pungent, bitter, and astringent tastes',
    'Honey (in small amounts, never cooked)',
    'Spices (ginger, black pepper, turmeric)',
    'Lentils, beans',
    'Astringent fruits (apples, pears, pomegranates)',
    'Leafy greens, cruciferous vegetables',
    'Warm herbal teas (ginger, cinnamon)',
  ];
  const kaphaReduce = [
    'Heavy, oily, and cold foods',
    'Sweet, sour, and salty tastes',
    'Dairy products (milk, cheese, yogurt)',
    'Sweet fruits (bananas, mangoes, avocados)',
    'Root vegetables (sweet potatoes, potatoes)',
    'Wheat, rice (in excess)',
    'Cold drinks',
  ];

  switch (prakruti) {
    case 'Vata':
      return {
        'description': 'Your Vata constitution benefits from grounding, warm, and nourishing (Satvik) foods. Focus on routine and warm, cooked meals.',
        'favor': vataFavor,
        'reduce': vataReduce,
      };
    case 'Pitta':
      return {
        'description': 'Your Pitta constitution benefits from cooling, refreshing, and hydrating (Satvik) foods. Avoid excess spice, heat, and oil.',
        'favor': pittaFavor,
        'reduce': pittaReduce,
      };
    case 'Kapha':
      return {
        'description': 'Your Kapha constitution benefits from light, warm, and stimulating (Satvik) foods. Focus on lightness and activity, avoiding heavy or oily meals.',
        'favor': kaphaFavor,
        'reduce': kaphaReduce,
      };
    default:
      return {
        'description': 'Select your prakruti to see diet recommendations.',
        'favor': [],
        'reduce': [],
      };
  }
}

// --- Exercise Data ---
Map<String, List<Exercise>> getExercisesForPrakruti(String prakruti) {
  final vataYoga = [
    Exercise(id: 'v_yoga_1', name: 'Sun Salutation (Surya Namaskar)', description: 'Slow and gentle pace'),
    Exercise(id: 'v_yoga_2', name: 'Child\'s Pose (Balasana)', description: 'Grounding and calming'),
    Exercise(id: 'v_yoga_3', name: 'Cat-Cow Pose (Marjaryasana-Bitilasana)', description: 'Warms the spine'),
    Exercise(id: 'v_yoga_4', name: 'Corpse Pose (Savasana)', description: 'For deep relaxation'),
  ];
  final vataExercise = [
    Exercise(id: 'v_ex_1', name: 'Gentle Walking', description: 'Mindful walking in nature'),
    Exercise(id: 'v_ex_2', name: 'Light Cycling', description: 'Steady, non-strenuous pace'),
    Exercise(id: 'v_ex_3', name: 'Tai Chi', description: 'Flowing and grounding movements'),
  ];

  final pittaYoga = [
    Exercise(id: 'p_yoga_1', name: 'Moon Salutation (Chandra Namaskar)', description: 'Cooling and calming'),
    Exercise(id: 'p_yoga_2', name: 'Cobra Pose (Bhujangasana)', description: 'Moderate backbend'),
    Exercise(id: 'p_yoga_3', name: 'Fish Pose (Matsyasana)', description: 'Opens the chest'),
    Exercise(id: 'p_yoga_4', name: 'Seated Forward Bend (Paschimottanasana)', description: 'Calms the mind'),
  ];
  final pittaExercise = [
    Exercise(id: 'p_ex_1', name: 'Swimming', description: 'Cooling and non-competitive'),
    Exercise(id: 'p_ex_2', name: 'Brisk Walk (in cool weather)', description: 'Early morning or evening'),
    Exercise(id: 'p_ex_3', name: 'Hiking (in shade)', description: 'Enjoying nature'),
  ];

  final kaphaYoga = [
    Exercise(id: 'k_yoga_1', name: 'Sun Salutation (Surya Namaskar)', description: 'Vigorous and flowing pace'),
    Exercise(id: 'k_yoga_2', name: 'Warrior Pose (Virabhadrasana)', description: 'Builds heat and strength'),
    Exercise(id: 'k_yoga_3', name: 'Bow Pose (Dhanurasana)', description: 'Stimulating and heart-opening'),
    Exercise(id: 'k_yoga_4', name: 'Breath of Fire (Kapalabhati)', description: 'Energizing pranayama (if appropriate)'),
  ];
  final kaphaExercise = [
    Exercise(id: 'k_ex_1', name: 'Jogging or Running', description: 'To stimulate circulation'),
    Exercise(id: 'k_ex_2', name: 'Vigorous Hiking', description: 'Challenging routes'),
    Exercise(id: 'k_ex_3', name:'Cycling (with hills)', description: 'Builds stamina'),
  ];

  switch (prakruti) {
    case 'Vata':
      return {'yoga': vataYoga, 'exercise': vataExercise};
    case 'Pitta':
      return {'yoga': pittaYoga, 'exercise': pittaExercise};
    case 'Kapha':
      return {'yoga': kaphaYoga, 'exercise': kaphaExercise};
    default:
      return {'yoga': [], 'exercise': []};
  }
}
