// ============================================================
// Fichier : lib/data/entries_data.dart
// Rôle    : Contient toutes les données de l'application.
//           Pas de base de données : tout est codé ici en dur.
// ============================================================

// On importe le modèle Entry pour pouvoir l'utiliser
import '../models/entry.dart';

// Liste globale de toutes les entrées de l'application.
// 'const' signifie que cette liste est immuable et créée à la compilation.
const List<Entry> allEntries = [

  // ──────────────────────────────────────────────
  //  DICTONS (au moins 6)
  // ──────────────────────────────────────────────

  Entry(
    id: 1,
    category: Category.dicton,
    text: 'En avril, ne te découvre pas d\'un fil.',
    meaning:
        'Au mois d\'avril, le temps reste imprévisible. Il ne faut pas encore '
        'enlever ses vêtements chauds, car il peut encore faire froid.',
    origin: 'Proverbe météorologique traditionnel',
    region: 'France entière',
    tags: ['météo', 'avril', 'printemps', 'vêtements', 'froid'],
  ),

  Entry(
    id: 2,
    category: Category.dicton,
    text: 'Qui sème le vent récolte la tempête.',
    meaning:
        'Celui qui provoque des troubles ou agit de façon irresponsable devra '
        'subir les conséquences graves de ses actions.',
    origin: 'Bible, livre d\'Osée (VIII, 7)',
    region: 'France entière',
    tags: ['conséquences', 'actions', 'responsabilité', 'Bible'],
  ),

  Entry(
    id: 3,
    category: Category.dicton,
    text: 'Mieux vaut prévenir que guérir.',
    meaning:
        'Il est préférable d\'éviter un problème à l\'avance plutôt que d\'avoir '
        'à le résoudre après coup.',
    origin: 'Proverbe médical populaire, attesté au XVIe siècle',
    region: 'France entière',
    tags: ['prudence', 'prévention', 'santé', 'sagesse'],
  ),

  Entry(
    id: 4,
    category: Category.dicton,
    text: 'Noël au balcon, Pâques au tison.',
    meaning:
        'Si le temps est doux et ensoleillé à Noël, il fera froid et on restera '
        'au coin du feu à Pâques. Les saisons se compensent.',
    origin: 'Calendrier agricole traditionnel',
    region: 'Sud de la France',
    tags: ['météo', 'Noël', 'Pâques', 'hiver', 'fêtes', 'soleil'],
  ),

  Entry(
    id: 5,
    category: Category.dicton,
    text: 'L\'habit ne fait pas le moine.',
    meaning:
        'On ne peut pas juger quelqu\'un sur son apparence ou ses vêtements. '
        'L\'intérieur vaut plus que l\'extérieur.',
    origin: 'Proverbe médiéval d\'origine latine : "Cucullus non facit monachum"',
    region: 'France entière',
    tags: ['apparence', 'jugement', 'sagesse', 'morale', 'habit'],
  ),

  Entry(
    id: 6,
    category: Category.dicton,
    text: 'Quand le vin est tiré, il faut le boire.',
    meaning:
        'Quand on a commencé quelque chose, il faut aller jusqu\'au bout. '
        'On ne peut plus revenir en arrière.',
    origin: 'Proverbe vigneron du Moyen Âge',
    region: 'Bourgogne, Bordeaux',
    tags: ['vin', 'engagement', 'détermination', 'persévérance'],
  ),

  Entry(
    id: 7,
    category: Category.dicton,
    text: 'À la Chandeleur, l\'hiver se meurt ou prend vigueur.',
    meaning:
        'Le 2 février (la Chandeleur), on observe la météo pour prédire la '
        'suite de l\'hiver : s\'il fait beau, l\'hiver continue ; sinon, il se termine.',
    origin: 'Tradition populaire liée à la fête de la Chandeleur',
    region: 'Bretagne, Normandie',
    tags: ['Chandeleur', 'hiver', 'météo', 'crêpes', 'février'],
  ),

  Entry(
    id: 8,
    category: Category.dicton,
    text: 'Petit à petit, l\'oiseau fait son nid.',
    meaning:
        'On accomplit de grandes choses en travaillant régulièrement, un peu '
        'chaque jour. La persévérance mène au succès.',
    origin: 'Fables de La Fontaine (inspiration)',
    region: 'France entière',
    tags: ['travail', 'patience', 'persévérance', 'oiseau', 'nid'],
  ),

  // ──────────────────────────────────────────────
  //  CITATIONS (au moins 6)
  // ──────────────────────────────────────────────

  Entry(
    id: 9,
    category: Category.citation,
    text: 'Je pense, donc je suis.',
    meaning:
        'Le fait même de douter prouve que l\'on existe en tant qu\'être pensant. '
        'C\'est le fondement de la philosophie cartésienne.',
    author: 'René Descartes',
    origin: 'Discours de la méthode (1637)',
    tags: ['philosophie', 'existence', 'pensée', 'Descartes', 'raison'],
  ),

  Entry(
    id: 10,
    category: Category.citation,
    text: 'La vie est courte, l\'art est long.',
    meaning:
        'La vie humaine ne suffit pas pour maîtriser un art ou une science. '
        'Il faut toujours continuer à apprendre.',
    author: 'Hippocrate (adapté par Molière)',
    origin: 'Aphorismes d\'Hippocrate, repris dans la culture française',
    tags: ['vie', 'art', 'temps', 'apprentissage', 'sagesse'],
  ),

  Entry(
    id: 11,
    category: Category.citation,
    text: 'On ne voit bien qu\'avec le cœur. L\'essentiel est invisible pour les yeux.',
    meaning:
        'Ce qui compte vraiment dans la vie — l\'amour, l\'amitié, la valeur des êtres — '
        'ne se voit pas avec les yeux mais se ressent avec le cœur.',
    author: 'Antoine de Saint-Exupéry',
    origin: 'Le Petit Prince (1943)',
    tags: ['cœur', 'amour', 'essentiel', 'Petit Prince', 'Saint-Exupéry'],
  ),

  Entry(
    id: 12,
    category: Category.citation,
    text: 'Être ou ne pas être, telle est la question.',
    meaning:
        'Cette citation philosophique interroge sur le sens de la vie et de la mort, '
        'sur le choix de continuer à exister malgré les souffrances.',
    author: 'William Shakespeare (traduit en français)',
    origin: 'Hamlet, Acte III, Scène 1',
    tags: ['existence', 'philosophie', 'vie', 'mort', 'Shakespeare', 'Hamlet'],
  ),

  Entry(
    id: 13,
    category: Category.citation,
    text: 'La liberté des uns s\'arrête où commence celle des autres.',
    meaning:
        'Chaque personne est libre, mais cette liberté a une limite : '
        'elle ne doit pas empiéter sur la liberté d\'autrui.',
    author: 'John Stuart Mill (popularisé en France)',
    origin: 'Principe fondateur du droit républicain français',
    tags: ['liberté', 'droit', 'République', 'philosophie', 'société'],
  ),

  Entry(
    id: 14,
    category: Category.citation,
    text: 'Il faut cultiver notre jardin.',
    meaning:
        'Plutôt que de se perdre dans des spéculations inutiles, mieux vaut '
        'travailler concrètement à ce qui est autour de nous.',
    author: 'Voltaire',
    origin: 'Candide, ou l\'Optimisme (1759)',
    tags: ['travail', 'pragmatisme', 'Voltaire', 'Candide', 'jardin'],
  ),

  Entry(
    id: 15,
    category: Category.citation,
    text: 'La vraie générosité envers l\'avenir consiste à tout donner au présent.',
    meaning:
        'Pour préparer un meilleur futur, il faut s\'engager pleinement '
        'dans l\'action présente, sans se réfugier dans des espoirs vagues.',
    author: 'Albert Camus',
    origin: 'L\'Homme révolté (1951)',
    tags: ['générosité', 'futur', 'présent', 'Camus', 'engagement'],
  ),

  Entry(
    id: 16,
    category: Category.citation,
    text: 'Rien ne se perd, rien ne se crée, tout se transforme.',
    meaning:
        'Dans l\'univers, la matière et l\'énergie ne disparaissent jamais : '
        'elles changent simplement de forme. Principe fondamental de la science.',
    author: 'Antoine Lavoisier',
    origin: 'Traité élémentaire de chimie (1789)',
    tags: ['science', 'chimie', 'matière', 'Lavoisier', 'transformation'],
  ),

  // ──────────────────────────────────────────────
  //  EXPRESSIONS (au moins 6)
  // ──────────────────────────────────────────────

  Entry(
    id: 17,
    category: Category.expression,
    text: 'Avoir le cafard.',
    meaning:
        'Se sentir triste, déprimé, mélancolique. Éprouver une tristesse '
        'passagère sans raison précise.',
    origin:
        'Expression du XIXe siècle popularisée par Baudelaire (Les Fleurs du Mal). '
        'Le cafard est un insecte rampant associé à la noirceur.',
    tags: ['tristesse', 'déprime', 'humeur', 'Baudelaire', 'cafard'],
  ),

  Entry(
    id: 18,
    category: Category.expression,
    text: 'Casser les pieds.',
    meaning:
        'Ennuyer quelqu\'un, être très agaçant ou importun. Importuner quelqu\'un '
        'au point de le fatiguer.',
    origin:
        'Expression familière française du XIXe siècle. Les pieds symbolisaient '
        'la liberté de mouvement, les "casser" signifiait entraver.',
    tags: ['ennuyer', 'agacer', 'famille', 'quotidien', 'irritation'],
  ),

  Entry(
    id: 19,
    category: Category.expression,
    text: 'Poser un lapin.',
    meaning:
        'Ne pas se présenter à un rendez-vous sans prévenir. Faire faux bond '
        'à quelqu\'un.',
    origin:
        'Originaire du XIXe siècle, liée au terme argotique "lapin" qui désignait '
        'quelqu\'un qui ne payait pas (notamment dans les maisons closes).',
    tags: ['rendez-vous', 'absence', 'lapin', 'argot', 'manque'],
  ),

  Entry(
    id: 20,
    category: Category.expression,
    text: 'Avoir d\'autres chats à fouetter.',
    meaning:
        'Avoir des choses plus importantes à faire. Ne pas vouloir s\'occuper '
        'd\'un problème jugé mineur.',
    origin:
        'Référence à l\'ancienne pratique de fouetter les chats comme spectacle '
        'populaire. Expression attestée au XVIIe siècle.',
    tags: ['priorité', 'chat', 'occupation', 'importance', 'tâche'],
  ),

  Entry(
    id: 21,
    category: Category.expression,
    text: 'Mettre les pieds dans le plat.',
    meaning:
        'Aborder un sujet délicat de façon maladroite ou sans tact. '
        'Dire tout haut ce que les autres pensent tout bas.',
    origin:
        'Expression familière française du XIXe siècle. Image d\'une personne '
        'maladroite qui pose le pied dans un plat de nourriture.',
    tags: ['maladresse', 'tact', 'conversation', 'sujet délicat', 'gaffe'],
  ),

  Entry(
    id: 22,
    category: Category.expression,
    text: 'Avoir le beurre et l\'argent du beurre.',
    meaning:
        'Vouloir tous les avantages d\'une situation sans en subir les '
        'inconvénients. Être cupide ou peu raisonnable dans ses exigences.',
    origin:
        'Expression paysanne française liée au commerce du beurre. '
        'Attestée au début du XXe siècle.',
    tags: ['avarice', 'exigence', 'beurre', 'avantage', 'contradiction'],
  ),

  Entry(
    id: 23,
    category: Category.expression,
    text: 'Prendre la poudre d\'escampette.',
    meaning:
        'S\'enfuir précipitamment, partir en cachette pour éviter une situation '
        'difficile ou dangereuse.',
    origin:
        'Du vieux français "escamper" (s\'échapper), lui-même de l\'italien '
        '"scampare". Utilisé dès le XVIIe siècle.',
    tags: ['fuite', 'escapade', 'échapper', 'secret', 'départ'],
  ),

  Entry(
    id: 24,
    category: Category.expression,
    text: 'Avoir le vent en poupe.',
    meaning:
        'Connaître le succès, être favorisé par les circonstances. '
        'Tout réussit, les affaires marchent bien.',
    origin:
        'Métaphore maritime : la poupe est l\'arrière du bateau. Avoir le vent '
        'en poupe signifie que le vent pousse favorablement le navire.',
    tags: ['succès', 'chance', 'mer', 'vent', 'réussite', 'navigation'],
  ),

  // ──────────────────────────────────────────────
  //  DICTONS (suite)
  // ──────────────────────────────────────────────

  Entry(
    id: 25,
    category: Category.dicton,
    text: 'Après la pluie, le beau temps.',
    meaning:
        'Après une période difficile ou triste, vient toujours une période '
        'meilleure. La patience est récompensée.',
    origin: 'Proverbe populaire français, attesté au XVIe siècle',
    region: 'France entière',
    tags: ['optimisme', 'patience', 'espoir', 'météo', 'résilience'],
  ),

  Entry(
    id: 26,
    category: Category.dicton,
    text: 'Les chiens aboient, la caravane passe.',
    meaning:
        'Les critiques et les jaloux font du bruit mais n\'empêchent pas '
        'les gens déterminés d\'avancer. Il faut ignorer les détracteurs.',
    origin: 'Proverbe d\'origine arabe introduit en France via l\'Espagne',
    region: 'Provence, Languedoc',
    tags: ['détermination', 'critique', 'indifférence', 'caravane', 'avancer'],
  ),

  Entry(
    id: 27,
    category: Category.dicton,
    text: 'Qui ne risque rien n\'a rien.',
    meaning:
        'Pour obtenir quelque chose de valeur, il faut accepter de prendre '
        'des risques. La prudence excessive mène à l\'inaction.',
    origin: 'Proverbe populaire français, XVIIe siècle',
    region: 'France entière',
    tags: ['risque', 'courage', 'ambition', 'récompense', 'audace'],
  ),

  Entry(
    id: 28,
    category: Category.dicton,
    text: 'À bon entendeur, salut.',
    meaning:
        'Que celui qui comprend ce message en tienne compte. Un avertissement '
        'discret à celui qui sait de quoi on parle.',
    origin: 'Locution proverbiale du Moyen Âge, du latin "intelligenti pauca"',
    region: 'France entière',
    tags: ['avertissement', 'compréhension', 'discrétion', 'sous-entendu'],
  ),

  Entry(
    id: 29,
    category: Category.dicton,
    text: 'Vouloir, c\'est pouvoir.',
    meaning:
        'Avec une volonté suffisante, on peut accomplir ce qu\'on se fixe. '
        'La motivation est la clé du succès.',
    origin: 'Proverbe popularisé au XIXe siècle, traduit de l\'anglais',
    region: 'France entière',
    tags: ['volonté', 'motivation', 'succès', 'détermination', 'pouvoir'],
  ),

  Entry(
    id: 30,
    category: Category.dicton,
    text: 'Tel père, tel fils.',
    meaning:
        'Les enfants ressemblent souvent à leurs parents en caractère, '
        'habitudes et comportement. L\'éducation familiale forge la personnalité.',
    origin: 'Proverbe d\'origine latine : "Qualis pater, talis filius"',
    region: 'France entière',
    tags: ['famille', 'héritage', 'éducation', 'père', 'ressemblance'],
  ),

  Entry(
    id: 31,
    category: Category.dicton,
    text: 'Charité bien ordonnée commence par soi-même.',
    meaning:
        'Avant d\'aider les autres, il faut d\'abord s\'assurer de ses propres '
        'besoins. Prendre soin de soi n\'est pas de l\'égoïsme.',
    origin: 'Proverbe chrétien, attesté en France depuis le XVIe siècle',
    region: 'France entière',
    tags: ['charité', 'générosité', 'soi', 'priorité', 'morale'],
  ),

  Entry(
    id: 32,
    category: Category.dicton,
    text: 'Il ne faut pas vendre la peau de l\'ours avant de l\'avoir tué.',
    meaning:
        'On ne doit pas compter sur un succès avant qu\'il soit acquis, '
        'ni se réjouir d\'un résultat incertain à l\'avance.',
    origin: 'Fable de La Fontaine, "L\'Ours et les deux compagnons" (1678)',
    region: 'France entière',
    tags: ['précipitation', 'prudence', 'ours', 'La Fontaine', 'optimisme prématuré'],
  ),

  Entry(
    id: 33,
    category: Category.dicton,
    text: 'Quand on veut noyer son chien, on dit qu\'il a la rage.',
    meaning:
        'Quand on cherche à nuire à quelqu\'un, on trouve toujours un prétexte. '
        'Les accusations peuvent cacher de mauvaises intentions.',
    origin: 'Proverbe populaire français du XVIIe siècle',
    region: 'France entière',
    tags: ['prétexte', 'injustice', 'chien', 'mauvaise foi', 'accusation'],
  ),

  Entry(
    id: 34,
    category: Category.dicton,
    text: 'En mai, fais ce qu\'il te plaît.',
    meaning:
        'Au mois de mai, la météo est enfin stable et douce. On peut se '
        'débarrasser de ses vêtements chauds et profiter de la vie.',
    origin: 'Suite du proverbe "En avril, ne te découvre pas d\'un fil"',
    region: 'France entière',
    tags: ['mai', 'printemps', 'météo', 'liberté', 'vêtements'],
  ),

  Entry(
    id: 35,
    category: Category.dicton,
    text: 'Abondance de biens ne nuit pas.',
    meaning:
        'Avoir beaucoup de quelque chose de bon ne pose pas de problème. '
        'On peut toujours prendre plus quand c\'est une bonne chose.',
    origin: 'Proverbe populaire français, attesté au XVIe siècle',
    region: 'France entière',
    tags: ['abondance', 'richesse', 'générosité', 'biens', 'surplus'],
  ),

  Entry(
    id: 36,
    category: Category.dicton,
    text: 'La nuit, tous les chats sont gris.',
    meaning:
        'Dans l\'obscurité, les différences s\'effacent et l\'on ne distingue '
        'plus le beau du laid, le bon du mauvais.',
    origin: 'Proverbe attesté dès le XVe siècle en France',
    region: 'France entière',
    tags: ['nuit', 'chat', 'apparence', 'obscurité', 'égalité'],
  ),

  Entry(
    id: 37,
    category: Category.dicton,
    text: 'Pierre qui roule n\'amasse pas mousse.',
    meaning:
        'Quelqu\'un qui change constamment de lieu, de travail ou de situation '
        'ne peut pas construire quelque chose de solide ni accumuler de richesses.',
    origin: 'Proverbe d\'origine latine, très répandu en Europe dès le Moyen Âge',
    region: 'France entière',
    tags: ['stabilité', 'voyage', 'richesse', 'pierre', 'constance'],
  ),

  Entry(
    id: 38,
    category: Category.dicton,
    text: 'Comparaison n\'est pas raison.',
    meaning:
        'Le fait de comparer deux choses ne prouve pas que l\'une est meilleure '
        'que l\'autre. Une analogie n\'est pas un argument.',
    origin: 'Proverbe logique français, XVIe siècle',
    region: 'France entière',
    tags: ['logique', 'raisonnement', 'comparaison', 'argument', 'débat'],
  ),

  Entry(
    id: 39,
    category: Category.dicton,
    text: 'Tout ce qui brille n\'est pas or.',
    meaning:
        'Les apparences peuvent être trompeuses. Ce qui semble précieux '
        'ou attrayant au premier regard ne l\'est pas forcément.',
    origin: 'Proverbe d\'origine médiévale, popularisé par Shakespeare en anglais',
    region: 'France entière',
    tags: ['apparence', 'tromperie', 'or', 'valeur', 'méfiance'],
  ),

  Entry(
    id: 40,
    category: Category.dicton,
    text: 'Aux grands maux, les grands remèdes.',
    meaning:
        'Face à un problème grave ou une situation extrême, il faut prendre '
        'des mesures également fortes et décisives.',
    origin: 'Proverbe médical populaire, attesté au XVIe siècle',
    region: 'France entière',
    tags: ['problème', 'solution', 'décision', 'crise', 'remède'],
  ),

  // ──────────────────────────────────────────────
  //  PROVERBES
  // ──────────────────────────────────────────────

  Entry(
    id: 67,
    category: Category.proverbe,
    text: 'La patience est la mère de toutes les vertus.',
    meaning:
        'La patience est la qualité fondamentale à partir de laquelle toutes '
        'les autres vertus humaines se développent. Sans elle, rien de grand ne s\'accomplit.',
    origin: 'Proverbe moral d\'origine latine, répandu en France depuis le Moyen Âge',
    tags: ['patience', 'vertu', 'sagesse', 'morale', 'caractère'],
  ),

  Entry(
    id: 68,
    category: Category.proverbe,
    text: 'Aide-toi, le ciel t\'aidera.',
    meaning:
        'Dieu — ou la chance — ne vient en aide qu\'à ceux qui font d\'abord '
        'des efforts par eux-mêmes. L\'initiative personnelle attire la bienveillance.',
    origin: 'Fable de La Fontaine, "Le Chartier embourbé" (1678)',
    tags: ['effort', 'initiative', 'foi', 'La Fontaine', 'providence', 'travail'],
  ),

  Entry(
    id: 69,
    category: Category.proverbe,
    text: 'Un tiens vaut mieux que deux tu l\'auras.',
    meaning:
        'Mieux vaut posséder quelque chose de certain aujourd\'hui que d\'espérer '
        'obtenir davantage demain. La réalité présente vaut mieux que les promesses futures.',
    origin: 'Fable de La Fontaine, "Le Petit Poisson et le Pêcheur" (1668)',
    tags: ['certitude', 'promesse', 'réalité', 'La Fontaine', 'prudence', 'présent'],
  ),

  Entry(
    id: 70,
    category: Category.proverbe,
    text: 'La vérité sort de la bouche des enfants.',
    meaning:
        'Les enfants, n\'ayant pas encore appris à dissimuler ou à mentir par '
        'politesse, disent souvent des vérités que les adultes taisent.',
    origin: 'Proverbe biblique (Psaumes 8:2), intégré dans la culture française',
    tags: ['vérité', 'enfant', 'innocence', 'sincérité', 'Bible'],
  ),

  Entry(
    id: 71,
    category: Category.proverbe,
    text: 'Les murs ont des oreilles.',
    meaning:
        'Il faut faire attention à ce qu\'on dit car on peut être écouté sans '
        'le savoir, même dans un endroit qui semble privé.',
    origin: 'Proverbe populaire français, très répandu depuis le XVIe siècle',
    tags: ['secret', 'prudence', 'écoute', 'confidentialité', 'surveillance'],
  ),

  Entry(
    id: 72,
    category: Category.proverbe,
    text: 'On ne fait pas d\'omelette sans casser des œufs.',
    meaning:
        'Pour atteindre un objectif important, il faut accepter certains '
        'sacrifices ou inconvénients. Tout progrès a un coût.',
    origin: 'Proverbe culinaire français popularisé au XVIIIe siècle',
    tags: ['sacrifice', 'objectif', 'omelette', 'œuf', 'coût', 'progrès'],
  ),

  Entry(
    id: 73,
    category: Category.proverbe,
    text: 'Mieux vaut tard que jamais.',
    meaning:
        'Il vaut mieux faire quelque chose en retard que de ne jamais le faire '
        'du tout. Un accomplissement tardif reste un accomplissement.',
    origin: 'Proverbe d\'origine latine "Potius sero quam nunquam", repris en français',
    tags: ['retard', 'accomplissement', 'temps', 'sagesse', 'action'],
  ),

  Entry(
    id: 74,
    category: Category.proverbe,
    text: 'Chacun voit midi à sa porte.',
    meaning:
        'Chaque personne juge les choses selon son propre intérêt ou son point '
        'de vue. La subjectivité guide souvent nos opinions.',
    origin: 'Proverbe français attesté au XVIe siècle, référence à l\'heure locale',
    tags: ['subjectivité', 'point de vue', 'intérêt', 'jugement', 'égocentrisme'],
  ),

  Entry(
    id: 75,
    category: Category.proverbe,
    text: 'Loin des yeux, loin du cœur.',
    meaning:
        'L\'éloignement géographique affaiblit progressivement les liens '
        'affectifs. L\'absence use les sentiments.',
    origin: 'Proverbe latin "Longe recedunt, recedunt amores", traduit en français',
    tags: ['absence', 'amour', 'distance', 'oubli', 'sentiment', 'séparation'],
  ),

  Entry(
    id: 76,
    category: Category.proverbe,
    text: 'Qui trop embrasse mal étreint.',
    meaning:
        'Vouloir tout faire à la fois conduit à mal faire les choses. '
        'Trop d\'ambition dispersée nuit à la qualité du travail.',
    origin: 'Proverbe français du XIIe siècle, très ancienne sagesse populaire',
    tags: ['ambition', 'concentration', 'qualité', 'dispersion', 'priorité'],
  ),

  Entry(
    id: 77,
    category: Category.proverbe,
    text: 'Nul n\'est prophète en son pays.',
    meaning:
        'On est rarement reconnu et apprécié à sa juste valeur dans son '
        'propre environnement familier. Le mérite est souvent mieux reconnu ailleurs.',
    origin: 'Évangile de Luc (4:24), popularisé en France dès le Moyen Âge',
    tags: ['reconnaissance', 'valeur', 'pays', 'prophète', 'mérite', 'Bible'],
  ),

  Entry(
    id: 78,
    category: Category.proverbe,
    text: 'À cœur vaillant, rien d\'impossible.',
    meaning:
        'Avec du courage et de la détermination, on peut surmonter tous les '
        'obstacles. La bravoure ouvre toutes les portes.',
    origin: 'Devise attribuée à Jacques Cœur (XVe siècle), argentier du roi Charles VII',
    tags: ['courage', 'détermination', 'impossible', 'vaillance', 'devise'],
  ),

  Entry(
    id: 79,
    category: Category.proverbe,
    text: 'Dis-moi qui tu fréquentes, je te dirai qui tu es.',
    meaning:
        'On peut juger une personne par les gens qu\'elle choisit de fréquenter. '
        'Notre entourage reflète nos valeurs et notre caractère.',
    origin: 'Proverbe moral latin "Noscitur ex sociis", diffusé en France au XVIe siècle',
    tags: ['entourage', 'amitié', 'caractère', 'valeurs', 'influence', 'société'],
  ),

  Entry(
    id: 80,
    category: Category.proverbe,
    text: 'Le mieux est l\'ennemi du bien.',
    meaning:
        'En cherchant à améliorer ce qui est déjà satisfaisant, on risque de '
        'le gâcher. La perfection excessive peut nuire à un bon résultat.',
    origin: 'Voltaire, Dictionnaire philosophique (1764)',
    tags: ['perfection', 'Voltaire', 'qualité', 'sagesse', 'pragmatisme'],
  ),

  Entry(
    id: 81,
    category: Category.proverbe,
    text: 'L\'union fait la force.',
    meaning:
        'Les personnes qui s\'unissent et coopèrent sont beaucoup plus '
        'puissantes que celles qui agissent séparément.',
    origin: 'Devise républicaine, d\'origine latine "Vis unita fortior"',
    tags: ['union', 'solidarité', 'force', 'collectif', 'coopération'],
  ),

  // ──────────────────────────────────────────────
  //  CITATIONS (suite)
  // ──────────────────────────────────────────────

  Entry(
    id: 41,
    category: Category.citation,
    text: 'Le cœur a ses raisons que la raison ne connaît point.',
    meaning:
        'Les sentiments et les émotions obéissent à leur propre logique, '
        'incompréhensible pour la pure raison intellectuelle.',
    author: 'Blaise Pascal',
    origin: 'Pensées (1670, publiées posthumément)',
    tags: ['cœur', 'raison', 'émotions', 'Pascal', 'amour', 'philosophie'],
  ),

  Entry(
    id: 42,
    category: Category.citation,
    text: 'L\'enfer, c\'est les autres.',
    meaning:
        'Notre existence est constamment définie et jugée par le regard des '
        'autres. La présence d\'autrui peut être vécue comme une contrainte insupportable.',
    author: 'Jean-Paul Sartre',
    origin: 'Huis Clos (1944)',
    tags: ['enfer', 'autres', 'regard', 'Sartre', 'existentialisme', 'liberté'],
  ),

  Entry(
    id: 43,
    category: Category.citation,
    text: 'Je suis ce que je suis, et c\'est tout ce que je suis.',
    meaning:
        'Revendication d\'une identité authentique et assumée, sans masque '
        'ni artifice. L\'être humain est entier et complet tel qu\'il est.',
    author: 'Victor Hugo',
    origin: 'Les Misérables (1862)',
    tags: ['identité', 'authenticité', 'Hugo', 'être', 'affirmation de soi'],
  ),

  Entry(
    id: 44,
    category: Category.citation,
    text: 'Mieux vaut une tête bien faite qu\'une tête bien pleine.',
    meaning:
        'Il est plus important de savoir penser, analyser et raisonner que '
        'd\'accumuler des connaissances sans en comprendre le sens.',
    author: 'Michel de Montaigne',
    origin: 'Essais, Livre I (1580)',
    tags: ['éducation', 'intelligence', 'Montaigne', 'pensée', 'connaissance'],
  ),

  Entry(
    id: 45,
    category: Category.citation,
    text: 'La connaissance s\'acquiert par l\'expérience, tout le reste n\'est qu\'information.',
    meaning:
        'Le savoir véritable vient de ce qu\'on a vécu et expérimenté soi-même. '
        'Ce qu\'on lit ou entend n\'est que matière brute.',
    author: 'Albert Einstein',
    origin: 'Citations attribuées à Einstein, large diffusion en France',
    tags: ['connaissance', 'expérience', 'information', 'Einstein', 'apprentissage'],
  ),

  Entry(
    id: 46,
    category: Category.citation,
    text: 'La poésie est l\'écho du cœur de Dieu dans l\'âme des hommes.',
    meaning:
        'La poésie permet à l\'être humain de toucher quelque chose de '
        'transcendant, de divin, qui dépasse la réalité quotidienne.',
    author: 'Victor Hugo',
    origin: 'William Shakespeare (1864)',
    tags: ['poésie', 'Hugo', 'Dieu', 'âme', 'art', 'transcendance'],
  ),

  Entry(
    id: 47,
    category: Category.citation,
    text: 'On ne naît pas femme, on le devient.',
    meaning:
        'Le genre féminin n\'est pas une donnée biologique figée mais une '
        'construction sociale et culturelle forgée tout au long de la vie.',
    author: 'Simone de Beauvoir',
    origin: 'Le Deuxième Sexe (1949)',
    tags: ['féminisme', 'Beauvoir', 'femme', 'société', 'identité', 'genre'],
  ),

  Entry(
    id: 48,
    category: Category.citation,
    text: 'Il n\'y a qu\'un héroïsme au monde : c\'est de voir le monde tel qu\'il est et de l\'aimer.',
    meaning:
        'Le vrai courage n\'est pas de fuir la réalité, mais de la regarder '
        'en face avec toutes ses imperfections et de continuer à l\'aimer.',
    author: 'Romain Rolland',
    origin: 'Jean-Christophe (1904-1912)',
    tags: ['héroïsme', 'amour', 'réalité', 'Rolland', 'courage', 'lucidité'],
  ),

  Entry(
    id: 49,
    category: Category.citation,
    text: 'Celui qui ouvre une porte d\'école, ferme une prison.',
    meaning:
        'L\'éducation est le meilleur remède contre la délinquance et '
        'la violence sociale. Instruire, c\'est libérer.',
    author: 'Victor Hugo',
    origin: 'Discours à l\'Assemblée nationale (1850)',
    tags: ['éducation', 'école', 'prison', 'Hugo', 'société', 'liberté'],
  ),

  Entry(
    id: 50,
    category: Category.citation,
    text: 'Vivre, c\'est choisir.',
    meaning:
        'Chaque instant de notre vie est une succession de choix. '
        'Exister, c\'est donc assumer pleinement sa liberté et sa responsabilité.',
    author: 'Jean-Paul Sartre',
    origin: 'L\'Existentialisme est un humanisme (1946)',
    tags: ['liberté', 'choix', 'Sartre', 'existentialisme', 'responsabilité'],
  ),

  Entry(
    id: 51,
    category: Category.citation,
    text: 'Toute vérité franchit trois étapes : d\'abord elle est ridiculisée, '
        'ensuite elle est violemment combattue, puis elle est acceptée comme évidente.',
    meaning:
        'Les grandes découvertes et idées nouvelles sont d\'abord rejetées '
        'avant d\'être reconnues. L\'innovation doit affronter la résistance.',
    author: 'Arthur Schopenhauer (diffusé en France)',
    origin: 'Paraphrase répandue dans la culture française',
    tags: ['vérité', 'innovation', 'résistance', 'idées', 'progrès'],
  ),

  Entry(
    id: 52,
    category: Category.citation,
    text: 'La musique est une révélation plus haute que toute sagesse et philosophie.',
    meaning:
        'La musique atteint des vérités profondes sur l\'existence que '
        'ni les mots ni la logique ne peuvent exprimer.',
    author: 'Ludwig van Beethoven (cité en France)',
    origin: 'Propos de Beethoven, traduit et diffusé en France au XIXe siècle',
    tags: ['musique', 'art', 'sagesse', 'philosophie', 'Beethoven', 'révélation'],
  ),

  Entry(
    id: 53,
    category: Category.citation,
    text: 'Le bonheur est une décision.',
    meaning:
        'On choisit d\'être heureux ou malheureux. Le bonheur ne vient pas '
        'des circonstances extérieures mais de notre état d\'esprit intérieur.',
    author: 'Aristote (interprétation française)',
    origin: 'Éthique à Nicomaque, largement commenté en France',
    tags: ['bonheur', 'choix', 'Aristote', 'philosophie', 'intérieur'],
  ),

  // ──────────────────────────────────────────────
  //  EXPRESSIONS (suite)
  // ──────────────────────────────────────────────

  Entry(
    id: 54,
    category: Category.expression,
    text: 'Tomber dans les pommes.',
    meaning:
        'S\'évanouir, perdre connaissance brusquement suite à une émotion '
        'forte, à la chaleur ou à la fatigue.',
    origin:
        'L\'origine est débattue. Une théorie relie l\'expression à George Sand '
        'qui écrivait "être dans les pommes cuites" (être épuisé, XIXe siècle).',
    tags: ['évanouissement', 'malaise', 'pomme', 'faiblesse', 'santé'],
  ),

  Entry(
    id: 55,
    category: Category.expression,
    text: 'Avoir le coup de foudre.',
    meaning:
        'Tomber amoureux instantanément et intensément. Ressentir une attirance '
        'foudroyante et immédiate pour quelqu\'un.',
    origin:
        'Métaphore électrique apparue au XVIIIe siècle après les découvertes '
        'de Franklin sur la foudre. La violence de l\'impact symbolise l\'intensité du sentiment.',
    tags: ['amour', 'coup de foudre', 'sentiment', 'rencontre', 'passion'],
  ),

  Entry(
    id: 56,
    category: Category.expression,
    text: 'Brûler la chandelle par les deux bouts.',
    meaning:
        'Dépenser son énergie ou ses ressources de façon excessive, en travaillant '
        'trop ou en menant une vie trop intense. Risquer l\'épuisement.',
    origin:
        'Expression du XVIIe siècle évoquant une chandelle qui brûlerait par '
        'les deux extrémités et se consumerait deux fois plus vite.',
    tags: ['épuisement', 'excès', 'énergie', 'santé', 'travail', 'chandelle'],
  ),

  Entry(
    id: 57,
    category: Category.expression,
    text: 'Avoir d\'autres cordes à son arc.',
    meaning:
        'Posséder plusieurs compétences ou ressources alternatives. '
        'Pouvoir se retourner différemment si une solution ne marche pas.',
    origin:
        'Métaphore militaire médiévale : un archer expérimenté portait '
        'plusieurs cordes de rechange pour son arc, par sécurité.',
    tags: ['compétences', 'ressources', 'arc', 'alternative', 'polyvalence'],
  ),

  Entry(
    id: 58,
    category: Category.expression,
    text: 'Noyer le poisson.',
    meaning:
        'Embrouiller volontairement une situation ou un débat pour éviter '
        'de répondre clairement à une question embarrassante.',
    origin:
        'Technique de pêche : épuiser un poisson ferré en le faisant nager '
        'dans tous les sens. Par extension, épuiser la vigilance de l\'interlocuteur.',
    tags: ['ruse', 'esquive', 'débat', 'tromperie', 'poisson', 'confusion'],
  ),

  Entry(
    id: 59,
    category: Category.expression,
    text: 'Avoir les yeux plus grands que le ventre.',
    meaning:
        'Prendre ou vouloir plus qu\'on ne peut absorber ou accomplir. '
        'Surestimer ses capacités ou son appétit.',
    origin:
        'Expression culinaire française, attestée au XVIe siècle. '
        'Image d\'une personne qui se sert trop dans son assiette.',
    tags: ['appétit', 'excès', 'ambition', 'nourriture', 'surestimation'],
  ),

  Entry(
    id: 60,
    category: Category.expression,
    text: 'Faire la fine bouche.',
    meaning:
        'Être difficile, exigeant, voire dédaigneux. Refuser ce qu\'on '
        'vous offre par caprice ou par prétention.',
    origin:
        'Expression française du XVIIe siècle. Faire "la fine bouche" '
        'désignait la personne qui mange peu par affectation.',
    tags: ['caprice', 'exigence', 'nourriture', 'dédain', 'bouche'],
  ),

  Entry(
    id: 61,
    category: Category.expression,
    text: 'Pisser dans un violon.',
    meaning:
        'Faire quelque chose d\'entièrement inutile et sans aucun résultat. '
        'Perdre son temps dans une action vaine.',
    origin:
        'Expression populaire française du XIXe siècle, image absurde '
        'illustrant l\'inutilité totale d\'une action.',
    tags: ['inutile', 'perte de temps', 'vain', 'absurde', 'effort'],
  ),

  Entry(
    id: 62,
    category: Category.expression,
    text: 'Avoir le bras long.',
    meaning:
        'Être influent, avoir des relations puissantes ou des connexions '
        'dans les hautes sphères qui permettent d\'obtenir des faveurs.',
    origin:
        'Image d\'un personnage pouvant atteindre loin grâce à son influence. '
        'Expression attestée au XVIIe siècle.',
    tags: ['influence', 'pouvoir', 'relations', 'politique', 'piston'],
  ),

  Entry(
    id: 63,
    category: Category.expression,
    text: 'Mettre son grain de sel.',
    meaning:
        'S\'immiscer dans une conversation ou une affaire qui ne nous concerne '
        'pas pour donner son avis, souvent sans y être invité.',
    origin:
        'Le sel était autrefois très précieux et associé à la sagesse (le "sel" '
        'de l\'esprit). "Y mettre son grain" signifiait imposer son avis.',
    tags: ['ingérence', 'opinion', 'sel', 'conversation', 'imposition'],
  ),

  Entry(
    id: 64,
    category: Category.expression,
    text: 'Garder la poire pour la soif.',
    meaning:
        'Mettre de côté des ressources ou des économies pour faire face '
        'à des besoins futurs. Prévoir les difficultés à venir.',
    origin:
        'Expression du XVIe siècle. La poire, fruit conservable, symbolisait '
        'la réserve prudente face aux privations futures.',
    tags: ['épargne', 'prévoyance', 'économie', 'poire', 'futur'],
  ),

  Entry(
    id: 65,
    category: Category.expression,
    text: 'Avoir la mémoire courte.',
    meaning:
        'Oublier facilement et rapidement, surtout ce qui est gênant ou '
        'ce dont on devrait tenir compte. Manquer de mémoire ou de reconnaissance.',
    origin:
        'Expression familière française, attestée au XIXe siècle. '
        'Souvent utilisée pour pointer l\'ingratitude.',
    tags: ['mémoire', 'oubli', 'ingratitude', 'souvenir', 'passé'],
  ),

  Entry(
    id: 66,
    category: Category.expression,
    text: 'Arriver comme un cheveu sur la soupe.',
    meaning:
        'Survenir de façon totalement inopportune, à contretemps, '
        'dans une situation où l\'on n\'est pas le bienvenu.',
    origin:
        'Image culinaire française du XIXe siècle : un cheveu dans la soupe '
        'est indésirable et gâche le repas.',
    tags: ['inopportun', 'mauvais timing', 'cheveu', 'soupe', 'maladresse'],
  ),

  // ──────────────────────────────────────────────
  //  DICTONS SUPPLÉMENTAIRES
  // ──────────────────────────────────────────────

  Entry(
    id: 82,
    category: Category.dicton,
    text: 'Après la pluie, le beau temps.',
    meaning:
        'Les difficultés et les épreuves sont toujours suivies de périodes '
        'meilleures. Il faut savoir patienter car les choses finissent par s\'arranger.',
    origin: 'Proverbe météorologique populaire, attesté dès le XVIe siècle',
    region: 'France entière',
    tags: ['espoir', 'patience', 'pluie', 'météo', 'optimisme', 'consolation'],
  ),

  Entry(
    id: 83,
    category: Category.dicton,
    text: 'En mai, fais ce qu\'il te plaît.',
    meaning:
        'Au mois de mai, le temps est devenu suffisamment doux et stable pour '
        'qu\'on puisse se permettre toutes les activités en plein air, y compris '
        's\'habiller légèrement.',
    origin: 'Calendrier agricole traditionnel, complément du dicton d\'avril',
    region: 'France entière',
    tags: ['mai', 'météo', 'printemps', 'liberté', 'douceur', 'vêtements'],
  ),

  Entry(
    id: 84,
    category: Category.dicton,
    text: 'Année de neige, année de blé.',
    meaning:
        'Un hiver enneigé est annonciateur d\'une bonne récolte de céréales. '
        'La neige protège les semis du gel et enrichit le sol en eau au printemps.',
    origin: 'Sagesse paysanne, observée depuis le Moyen Âge',
    region: 'Régions céréalières de France',
    tags: ['neige', 'hiver', 'blé', 'récolte', 'agriculture', 'météo'],
  ),

  Entry(
    id: 85,
    category: Category.dicton,
    text: 'Ciel rouge le soir, espoir ; ciel rouge le matin, chagrin.',
    meaning:
        'Un coucher de soleil rouge annonce beau temps le lendemain. '
        'Un lever de soleil rouge, en revanche, prédit pluie et mauvais temps '
        'pour la journée.',
    origin:
        'Observation météorologique ancienne, mentionnée dans la Bible '
        '(Matthieu 16:2-3) et utilisée par les marins depuis l\'Antiquité.',
    region: 'France entière, côtes atlantique et méditerranéenne',
    tags: ['ciel', 'rouge', 'météo', 'soir', 'matin', 'marin', 'prévision'],
  ),

  Entry(
    id: 86,
    category: Category.dicton,
    text: 'Noël au balcon, Pâques au tison.',
    meaning:
        'Un Noël doux et ensoleillé (au balcon) présage un Pâques froid '
        '(au coin du feu). Les saisons s\'inversent souvent selon ce dicton.',
    origin: 'Calendrier liturgique et agricole du Midi de la France',
    region: 'Sud de la France',
    tags: ['Noël', 'Pâques', 'météo', 'hiver', 'printemps', 'soleil', 'feu'],
  ),

  Entry(
    id: 87,
    category: Category.dicton,
    text: 'Pluie du matin n\'arrête pas le pèlerin.',
    meaning:
        'Une averse matinale n\'est généralement que passagère et ne doit '
        'pas décourager de se mettre en route. Le temps s\'améliorera dans '
        'la journée.',
    origin:
        'Proverbe du pèlerinage, attesté au Moyen Âge sur les chemins '
        'de Compostelle',
    region: 'France entière',
    tags: ['pluie', 'matin', 'météo', 'voyage', 'courage', 'optimisme'],
  ),

  Entry(
    id: 88,
    category: Category.dicton,
    text: 'Brouillard en mars, gelée en mai.',
    meaning:
        'Les brouillards fréquents en mars sont souvent le signe d\'un '
        'printemps tardif avec des risques de gelées encore en mai, '
        'dangereuses pour les cultures.',
    origin: 'Almanach paysan traditionnel, régions viticoles',
    region: 'Bourgogne, Alsace, Loire',
    tags: ['brouillard', 'mars', 'gelée', 'mai', 'météo', 'agriculture', 'vigne'],
  ),

  Entry(
    id: 89,
    category: Category.dicton,
    text: 'Saint-Médard pluvieux, quarante jours pluvieux.',
    meaning:
        'S\'il pleut le 8 juin, jour de la Saint-Médard, il pleuvra pendant '
        'quarante jours. Médard est le saint patron des vignes et de la pluie.',
    origin:
        'Dicton médiéval lié au calendrier des saints, similaire à la '
        'Sainte-Swithin anglaise',
    region: 'Nord et Centre de la France',
    tags: ['Saint-Médard', 'juin', 'pluie', 'quarante jours', 'météo', 'saints'],
  ),

  Entry(
    id: 90,
    category: Category.dicton,
    text: 'Qui a bu, boira.',
    meaning:
        'Quelqu\'un qui a eu de mauvaises habitudes les reprendra tôt ou tard. '
        'Le caractère et les vices d\'une personne sont difficiles à changer durablement.',
    origin:
        'Proverbe moral populaire, fréquent dans la littérature française '
        'du XVIIe siècle',
    region: 'France entière',
    tags: ['habitude', 'vice', 'caractère', 'récidive', 'alcool', 'comportement'],
  ),

  Entry(
    id: 91,
    category: Category.dicton,
    text: 'En mars, l\'alouette est en la lande.',
    meaning:
        'Le retour de l\'alouette dans les champs au début mars annonce '
        'la fin de l\'hiver et le début des travaux agricoles de printemps.',
    origin: 'Dicton agricole breton et normand, lié aux oiseaux migrateurs',
    region: 'Bretagne, Normandie',
    tags: ['mars', 'alouette', 'printemps', 'agriculture', 'oiseaux', 'saison'],
  ),

  Entry(
    id: 92,
    category: Category.dicton,
    text: 'L\'hiver de la Saint-Martin est l\'été des vieillards.',
    meaning:
        'La période de redoux qui survient souvent autour du 11 novembre '
        '(Saint-Martin) offre une dernière douceur automnale, que les anciens '
        'apprécient particulièrement.',
    origin:
        'Calendrier liturgique populaire ; "été de la Saint-Martin" est '
        'l\'équivalent de l\'été indien nord-américain',
    region: 'France entière',
    tags: ['Saint-Martin', 'novembre', 'automne', 'douceur', 'météo', 'vieillesse'],
  ),

  Entry(
    id: 93,
    category: Category.dicton,
    text: 'Quand il tonne en mars, l\'été sera beau.',
    meaning:
        'Le tonnerre en mars, signe de contrastes thermiques importants, '
        'était interprété par les paysans comme l\'annonce d\'un été chaud '
        'et ensoleillé.',
    origin: 'Almanach paysan traditionnel, observé dans les campagnes françaises',
    region: 'Centre et Ouest de la France',
    tags: ['tonnerre', 'mars', 'été', 'météo', 'agriculture', 'prévision'],
  ),

  Entry(
    id: 94,
    category: Category.dicton,
    text: 'Si la Chandeleur est claire, l\'hiver est derrière.',
    meaning:
        'Si le 2 février (Chandeleur) est ensoleillé, l\'hiver est presque '
        'terminé. À l\'inverse, s\'il fait mauvais, l\'hiver se prolonge encore '
        'quarante jours.',
    origin:
        'Fête chrétienne de la Présentation du Christ (2 février), '
        'associée aux premières crêpes et aux prédictions météo',
    region: 'France entière',
    tags: ['Chandeleur', 'février', 'hiver', 'printemps', 'météo', 'crêpes'],
  ),

  Entry(
    id: 95,
    category: Category.dicton,
    text: 'Vent du nord en été, chaleur l\'hiver.',
    meaning:
        'Les vents du nord apportant de la fraîcheur en été laissent '
        'présager un hiver relativement doux selon ce dicton maritime.',
    origin: 'Sagesse des marins bretons et normands, XVIe siècle',
    region: 'Bretagne, Normandie, côte atlantique',
    tags: ['vent', 'nord', 'été', 'hiver', 'météo', 'marin', 'atlantique'],
  ),

  Entry(
    id: 96,
    category: Category.dicton,
    text: 'Rossignol qui chante en janvier pleure en mars.',
    meaning:
        'Un rossignol qui chante trop tôt en hiver sera victime d\'un '
        'retour du froid au printemps. Se dit aussi d\'une personne qui '
        'se réjouit prématurément.',
    origin: 'Dicton populaire provençal, XVIIe siècle',
    region: 'Provence, Languedoc',
    tags: ['rossignol', 'janvier', 'mars', 'météo', 'printemps', 'oiseaux'],
  ),

  // ──────────────────────────────────────────────
  //  CITATIONS SUPPLÉMENTAIRES
  // ──────────────────────────────────────────────

  Entry(
    id: 97,
    category: Category.citation,
    text: 'Le cœur a ses raisons que la raison ne connaît point.',
    meaning:
        'Les sentiments et les émotions obéissent à leur propre logique, '
        'inaccessible à la raison pure. L\'amour et la foi échappent à '
        'l\'entendement rationnel.',
    author: 'Blaise Pascal',
    origin: 'Pensées, fragment 277, vers 1670',
    tags: ['cœur', 'raison', 'amour', 'Pascal', 'philosophie', 'sentiment'],
  ),

  Entry(
    id: 98,
    category: Category.citation,
    text: 'Je pense, donc je suis.',
    meaning:
        'La seule certitude indubitable est l\'existence du sujet pensant. '
        'En doutant de tout, on ne peut douter qu\'on est en train de douter, '
        'ce qui prouve qu\'on existe.',
    author: 'René Descartes',
    origin: 'Discours de la méthode, 1637',
    tags: ['philosophie', 'Descartes', 'doute', 'existence', 'raison', 'cogito'],
  ),

  Entry(
    id: 99,
    category: Category.citation,
    text: 'L\'enfer, c\'est les autres.',
    meaning:
        'Ce ne sont pas les souffrances physiques qui constituent l\'enfer, '
        'mais le regard des autres qui nous fige dans une image dont on ne '
        'peut s\'échapper. Autrui devient notre juge perpétuel.',
    author: 'Jean-Paul Sartre',
    origin: 'Huis clos, pièce de théâtre, 1944',
    tags: ['Sartre', 'enfer', 'autres', 'existentialisme', 'regard', 'liberté'],
  ),

  Entry(
    id: 100,
    category: Category.citation,
    text: 'On ne naît pas femme, on le devient.',
    meaning:
        'Le genre féminin n\'est pas une donnée naturelle innée mais une '
        'construction sociale et culturelle. La féminité est façonnée par '
        'la société, l\'éducation et les normes.',
    author: 'Simone de Beauvoir',
    origin: 'Le Deuxième Sexe, 1949',
    tags: ['Beauvoir', 'féminisme', 'femme', 'société', 'genre', 'existentialisme'],
  ),

  Entry(
    id: 101,
    category: Category.citation,
    text: 'Il faut imaginer Sisyphe heureux.',
    meaning:
        'Face à l\'absurdité de l\'existence — répéter éternellement un effort '
        'vain — la seule réponse valable est la révolte et l\'acceptation '
        'joyeuse de sa condition.',
    author: 'Albert Camus',
    origin: 'Le Mythe de Sisyphe, 1942',
    tags: ['Camus', 'Sisyphe', 'absurde', 'bonheur', 'révolte', 'existentialisme'],
  ),

  Entry(
    id: 102,
    category: Category.citation,
    text: 'La liberté des uns s\'arrête où commence celle des autres.',
    meaning:
        'Dans une société, chaque individu est libre tant qu\'il ne porte '
        'pas atteinte à la liberté d\'autrui. C\'est le fondement du '
        'contrat social démocratique.',
    author: 'John Stuart Mill',
    origin: 'De la liberté (On Liberty), 1859 — popularisé en France par la IIIe République',
    tags: ['liberté', 'droits', 'société', 'démocratie', 'limites', 'autrui'],
  ),

  Entry(
    id: 103,
    category: Category.citation,
    text: 'Tout ce qui est excessif est insignifiant.',
    meaning:
        'Ce qui dépasse la mesure perd de sa force et de sa valeur. '
        'L\'excès dilue l\'impact et nuit à la crédibilité de ce qu\'on '
        'veut exprimer.',
    author: 'Charles-Maurice de Talleyrand',
    origin: 'Attribué à Talleyrand, diplomate français (1754-1838)',
    tags: ['excès', 'mesure', 'sagesse', 'éloquence', 'diplomatie', 'Talleyrand'],
  ),

  Entry(
    id: 104,
    category: Category.citation,
    text: 'La vérité est rarement pure et n\'est jamais simple.',
    meaning:
        'La réalité est complexe, nuancée, pleine de contradictions. '
        'Toute affirmation présentée comme simple vérité doit être '
        'questionnée et nuancée.',
    author: 'Oscar Wilde',
    origin: 'L\'Importance d\'être constant (The Importance of Being Earnest), 1895',
    tags: ['vérité', 'complexité', 'Wilde', 'philosophie', 'ironie', 'nuance'],
  ),

  Entry(
    id: 105,
    category: Category.citation,
    text: 'Le génie, c\'est un pour cent d\'inspiration et quatre-vingt-dix-neuf pour cent de transpiration.',
    meaning:
        'Le talent naturel compte peu face au travail acharné. '
        'Les grandes réalisations sont avant tout le fruit d\'un effort '
        'considérable et d\'une persévérance sans relâche.',
    author: 'Thomas Edison',
    origin: 'Déclaration à la presse, 1903 — très répandu en France au XXe siècle',
    tags: ['génie', 'travail', 'talent', 'Edison', 'persévérance', 'inspiration'],
  ),

  Entry(
    id: 106,
    category: Category.citation,
    text: 'Celui qui déplace une montagne commence par enlever de petites pierres.',
    meaning:
        'Les grands accomplissements se réalisent par l\'accumulation de '
        'petites actions continues. La patience et la constance triomphent '
        'des obstacles les plus imposants.',
    author: 'Confucius',
    origin: 'Les Entretiens (Lun Yü), Ve siècle av. J.-C. — traduit et diffusé en France au XVIIIe siècle',
    tags: ['patience', 'effort', 'Confucius', 'sagesse', 'montagne', 'persévérance'],
  ),

  Entry(
    id: 107,
    category: Category.citation,
    text: 'Le bonheur, c\'est de continuer à désirer ce qu\'on possède.',
    meaning:
        'Le bonheur ne réside pas dans l\'acquisition de nouvelles choses '
        'mais dans la capacité à apprécier et à désirer ce qu\'on a déjà. '
        'L\'insatisfaction permanente est l\'ennemi du bonheur.',
    author: 'Saint Augustin',
    origin: 'Les Confessions, IVe-Ve siècle',
    tags: ['bonheur', 'désir', 'satisfaction', 'Augustin', 'possession', 'sagesse'],
  ),

  Entry(
    id: 108,
    category: Category.citation,
    text: 'Il vaut mieux agir et se repentir que se repentir de n\'avoir pas agi.',
    meaning:
        'Il est préférable d\'oser agir et d\'en assumer les conséquences '
        'que de rester paralysé par la peur et de regretter toute sa vie '
        'de n\'avoir pas tenté quelque chose.',
    author: 'Nicolas Machiavel',
    origin: 'Mandragore (La Mandragola), comédie, vers 1518',
    tags: ['action', 'regret', 'Machiavel', 'courage', 'décision', 'repentir'],
  ),

  Entry(
    id: 109,
    category: Category.citation,
    text: 'Connais-toi toi-même.',
    meaning:
        'L\'exploration intérieure et la connaissance de soi sont le '
        'commencement de toute sagesse. Sans se comprendre soi-même, '
        'on ne peut comprendre ni le monde ni autrui.',
    author: 'Socrate',
    origin:
        'Inscription sur le temple de Delphes, reprise par Socrate '
        'dans les dialogues de Platon, Ve siècle av. J.-C.',
    tags: ['Socrate', 'connaissance', 'sagesse', 'introspection', 'philosophie', 'Delphes'],
  ),

  // ──────────────────────────────────────────────
  //  EXPRESSIONS SUPPLÉMENTAIRES
  // ──────────────────────────────────────────────

  Entry(
    id: 110,
    category: Category.expression,
    text: 'Avoir le cafard.',
    meaning:
        'Se sentir déprimé, mélancolique, sans énergie. Être en proie '
        'à une tristesse diffuse sans raison particulière apparente.',
    origin:
        'Expression née dans les milieux militaires coloniaux au XIXe siècle. '
        'L\'Algérie, surnommée "le pays des cafards", était synonyme d\'ennui '
        'et d\'isolement pour les soldats.',
    tags: ['déprime', 'tristesse', 'mélancolie', 'cafard', 'humeur', 'moral'],
  ),

  Entry(
    id: 111,
    category: Category.expression,
    text: 'Tomber dans les pommes.',
    meaning:
        'S\'évanouir, perdre connaissance. Perdre ses esprits brusquement '
        'sous l\'effet d\'une émotion forte, de la chaleur ou de la fatigue.',
    origin:
        'Expression populaire attestée au XIXe siècle, dont l\'étymologie '
        'exacte est débattue. Certains y voient une altération de "tomber '
        'dans les pâmes" (pâmoisons).',
    tags: ['évanouissement', 'pommes', 'faiblesse', 'malaise', 'corps', 'chute'],
  ),

  Entry(
    id: 112,
    category: Category.expression,
    text: 'Poser un lapin.',
    meaning:
        'Ne pas se présenter à un rendez-vous fixé avec quelqu\'un, '
        'sans le prévenir. Faire faux bond délibérément.',
    origin:
        'Expression du XIXe siècle, issue du verbe "lapin" (argot pour '
        '"ne pas payer"). Ne pas honorer sa présence, c\'est "laisser '
        'quelqu\'un avec son lapin" (son impayé).',
    tags: ['rendez-vous', 'lapin', 'faux bond', 'absence', 'déception'],
  ),

  Entry(
    id: 113,
    category: Category.expression,
    text: 'Avoir le vent en poupe.',
    meaning:
        'Réussir, être favorisé par les circonstances, connaître une '
        'période de succès et de prospérité. Avoir tout pour soi.',
    origin:
        'Vocabulaire maritime : la poupe est l\'arrière d\'un bateau. '
        'Avoir le vent en poupe signifie naviguer avec le vent dans '
        'le dos, donc avancer facilement.',
    tags: ['succès', 'chance', 'vent', 'bateau', 'poupe', 'prospérité', 'maritime'],
  ),

  Entry(
    id: 114,
    category: Category.expression,
    text: 'Brûler la chandelle par les deux bouts.',
    meaning:
        'Dépenser ses forces, son argent ou son énergie de façon excessive '
        'et simultanée sur plusieurs fronts, au risque de s\'épuiser rapidement.',
    origin:
        'Image de la bougie consommée deux fois plus vite. Attestée au '
        'XVIIe siècle dans les milieux aristocratiques parlant de débauche.',
    tags: ['épuisement', 'excès', 'dépense', 'chandelle', 'énergie', 'santé'],
  ),

  Entry(
    id: 115,
    category: Category.expression,
    text: 'Mettre les pieds dans le plat.',
    meaning:
        'Dire ou faire quelque chose de maladroit ou d\'indiscret qui '
        'gêne ou choque l\'entourage. Aborder sans tact un sujet sensible.',
    origin:
        'Image d\'un geste gauchement mis dans un plat de service. '
        'Expression française du XIXe siècle, utilisée dans les milieux '
        'bourgeois.',
    tags: ['maladresse', 'indiscrétion', 'tact', 'gaffe', 'pied', 'plat'],
  ),

  Entry(
    id: 116,
    category: Category.expression,
    text: 'Casser les pieds.',
    meaning:
        'Ennuyer profondément quelqu\'un, l\'importuner, lui causer une '
        'grande irritation par son comportement insistant ou ses bavardages.',
    origin:
        'Expression familière française du XIXe siècle. Le pied, organe '
        'essentiel, représente métaphoriquement la patience de quelqu\'un.',
    tags: ['ennui', 'agacement', 'importuner', 'pied', 'patience', 'irritation'],
  ),

  Entry(
    id: 117,
    category: Category.expression,
    text: 'Avoir d\'autres chats à fouetter.',
    meaning:
        'Avoir des occupations plus importantes ou plus urgentes que ce '
        'dont on parle. Ne pas avoir de temps à consacrer à quelque chose '
        'd\'insignifiant.',
    origin:
        'Expression du XVIIe siècle, allusion aux supplices animaux '
        'utilisés comme châtiment. "Fouetter un chat" était une futilité '
        'à cette époque.',
    tags: ['priorité', 'occupation', 'chat', 'fouetter', 'temps', 'importance'],
  ),

  Entry(
    id: 118,
    category: Category.expression,
    text: 'Avoir le beurre et l\'argent du beurre.',
    meaning:
        'Vouloir profiter de deux avantages contradictoires à la fois, '
        'sans accepter le moindre inconvénient. Être cupide et insatisfait.',
    origin:
        'Expression paysanne française du XIXe siècle, issue du marché '
        'rural : vendre son beurre mais en garder la valeur monétaire '
        'est impossible.',
    tags: ['cupidité', 'avantages', 'beurre', 'argent', 'avidité', 'contradiction'],
  ),

  Entry(
    id: 119,
    category: Category.expression,
    text: 'Vendre la mèche.',
    meaning:
        'Révéler involontairement ou non un secret, dévoiler une '
        'information confidentielle qui devait rester cachée.',
    origin:
        'Expression militaire du XVIIe siècle : vendre la mèche d\'une '
        'mine explosive à l\'ennemi lui permettait de la désamorcer. '
        'Trahir un plan secret.',
    tags: ['secret', 'trahison', 'mèche', 'révélation', 'confidence', 'indiscrétion'],
  ),

  Entry(
    id: 120,
    category: Category.expression,
    text: 'Prendre ses jambes à son cou.',
    meaning:
        'S\'enfuir très rapidement, décamper à toute vitesse pour '
        'échapper à un danger ou à une situation désagréable.',
    origin:
        'Expression française attestée au XIIIe siècle. Image comique '
        'd\'un coureur dont les jambes semblent remonter jusqu\'au cou '
        'tellement il court vite.',
    tags: ['fuite', 'rapidité', 'jambes', 'cou', 'peur', 'course', 'danger'],
  ),

  // ──────────────────────────────────────────────
  //  PROVERBES SUPPLÉMENTAIRES
  // ──────────────────────────────────────────────

  Entry(
    id: 121,
    category: Category.proverbe,
    text: 'L\'argent ne fait pas le bonheur.',
    meaning:
        'La richesse matérielle n\'est pas suffisante pour être heureux. '
        'D\'autres valeurs — l\'amour, la santé, l\'amitié — comptent davantage '
        'que la fortune.',
    origin:
        'Proverbe universel, présent dans de nombreuses cultures. En France, '
        'attesté dès le XVe siècle sous diverses formes.',
    tags: ['argent', 'bonheur', 'richesse', 'valeurs', 'matérialisme', 'sagesse'],
  ),

  Entry(
    id: 122,
    category: Category.proverbe,
    text: 'Qui veut voyager loin ménage sa monture.',
    meaning:
        'Pour atteindre un objectif ambitieux et de longue haleine, '
        'il faut savoir gérer ses forces, avancer progressivement '
        'et ne pas s\'épuiser dès le début.',
    origin:
        'Proverbe classique français issu de la tradition équestre. '
        'Attesté dans la littérature morale du XVIIe siècle.',
    tags: ['patience', 'endurance', 'voyage', 'cheval', 'objectif', 'méthode'],
  ),

  Entry(
    id: 123,
    category: Category.proverbe,
    text: 'Le mieux est l\'ennemi du bien.',
    meaning:
        'En voulant parfaire quelque chose de bon, on risque de le '
        'gâcher ou de ne jamais le terminer. Savoir s\'arrêter quand '
        'quelque chose est satisfaisant est une sagesse pratique.',
    origin: 'Voltaire, La Bégueule, 1772 — devenu proverbe populaire',
    tags: ['perfectionnisme', 'sagesse', 'Voltaire', 'bon', 'mieux', 'pragmatisme'],
  ),

  Entry(
    id: 124,
    category: Category.proverbe,
    text: 'Les absents ont toujours tort.',
    meaning:
        'Ceux qui ne sont pas présents pour se défendre ou défendre '
        'leur point de vue sont facilement critiqués et mis en cause '
        'par ceux qui sont là.',
    origin: 'Philippe Néricault Destouches, L\'Obstacle imprévu, 1717',
    tags: ['absence', 'jugement', 'présence', 'tort', 'critique', 'défense'],
  ),

  Entry(
    id: 125,
    category: Category.proverbe,
    text: 'Nul n\'est prophète en son pays.',
    meaning:
        'On est rarement reconnu à sa juste valeur dans son propre '
        'entourage ou dans sa région natale. La familiarité engendre '
        'le mépris ou l\'indifférence.',
    origin:
        'Paroles de Jésus (Luc 4:24), reprises comme proverbe populaire '
        'depuis le Moyen Âge en France',
    tags: ['reconnaissance', 'pays', 'prophète', 'valeur', 'familiarité', 'Bible'],
  ),

  Entry(
    id: 126,
    category: Category.proverbe,
    text: 'À bon entendeur, salut.',
    meaning:
        'Que celui qui est concerné par ce qui vient d\'être dit '
        'en tienne compte et en tire les conséquences. Un avertissement '
        'adressé implicitement.',
    origin:
        'Proverbe latin "Verbum sapienti sat est" (une parole suffit '
        'au sage), adapté en français au XIVe siècle.',
    tags: ['avertissement', 'compréhension', 'sagesse', 'entendeur', 'implicite'],
  ),

  Entry(
    id: 127,
    category: Category.proverbe,
    text: 'La nuit porte conseil.',
    meaning:
        'Après une bonne nuit de sommeil, les idées sont plus claires '
        'et les décisions difficiles semblent plus faciles à prendre. '
        'Il vaut mieux ne pas décider dans l\'urgence.',
    origin:
        'Proverbe attesté dès le XVe siècle en français. Correspond '
        'au latin "Nox consilio amica" (la nuit est amie du conseil).',
    tags: ['nuit', 'sommeil', 'décision', 'conseil', 'patience', 'réflexion'],
  ),

  Entry(
    id: 128,
    category: Category.proverbe,
    text: 'Un tiens vaut mieux que deux tu l\'auras.',
    meaning:
        'Ce qu\'on possède réellement vaut mieux que des promesses '
        'incertaines. Il faut préférer une petite certitude à une '
        'grande espérance hypothétique.',
    origin:
        'La Fontaine, Le Petit Poisson et le Pêcheur, Fables, Livre V, 1668',
    tags: ['certitude', 'promesse', 'possession', 'La Fontaine', 'sagesse', 'réalisme'],
  ),

  Entry(
    id: 129,
    category: Category.proverbe,
    text: 'On n\'attrape pas les mouches avec du vinaigre.',
    meaning:
        'La douceur, la bienveillance et l\'affabilité sont plus '
        'efficaces que la dureté ou l\'aigreur pour obtenir ce qu\'on '
        'veut des autres.',
    origin:
        'Proverbe européen d\'origine médiévale, répandu en France '
        'depuis le XVIe siècle',
    tags: ['douceur', 'vinaigre', 'mouches', 'diplomatie', 'miel', 'relations'],
  ),

  Entry(
    id: 130,
    category: Category.proverbe,
    text: 'À chaque jour suffit sa peine.',
    meaning:
        'Il ne faut pas s\'inquiéter à l\'avance des malheurs futurs '
        'ni accumuler les soucis. Mieux vaut vivre au jour le jour '
        'et affronter les problèmes au fur et à mesure.',
    origin:
        'Paroles de Jésus, Évangile de Matthieu (6:34). Devenu '
        'proverbe populaire en France dès le Moyen Âge.',
    tags: ['présent', 'quotidien', 'soucis', 'Bible', 'sérénité', 'instant'],
  ),
];
