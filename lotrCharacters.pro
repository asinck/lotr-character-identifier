%Adam Sinck
%This program was written for my CSC 240 class. The goal was to write a 
%dichotomous key to identify something with whatever subject that the student
%chose. I chose to write a Lord of the Rings character identifier. This program
%will ask the user a series of questions, and tell them which character they
%are thinking of, and give a brief description of the character.
%The engine that powers this program was given to us by the professor, and 
%the code that I wrote begins at the comment that says, "This is the custom
%part of the program: the data."
%No modifications have been made to the program except for the intro
%comments. This program was tested on Ubuntu 14.04, using SWI-Prolog in
%the command line.

%This program will define an expert system and a decision tree.

%main controls

begin_program :-
    intro,
    write('Answer all questions y for yes or n for no.'), nl,
    clear_stored_answers,
    try_all_possibilities.

try_all_possibilities :-
    character_may_be(D),
    details(D),
    fail.

try_all_possibilities.

% case knowledge base -- user responses

:- dynamic(stored_answer/2).

% procedure to get rid of previous responses
% without abolishing the dynamic declaration

clear_stored_answers :- retract(stored_answer(_,_)), fail.

clear_stored_answers.

% procedure to ask the user a question and receive an
%  answer, or retrieve the result if already asked

user_says(Q,A) :- stored_answer(Q,A).

user_says(Q,A) :-
    \+ stored_answer(Q,_),
    nl,nl,
    ask_question(Q),
    get_yes_or_no(Response),
    asserta(stored_answer(Q,Response)),
    Response = A.

% prompt that obtains a yes or no answer

get_yes_or_no(Result) :-
    get(Char),   % read a single character
    get0(_),   % consume the return after it
    interpret(Char,Result),
    !.         %cut - only one result

get_yes_or_no(Result) :-
    nl,
    write('Type y or n'), nl,
    get_yes_or_no(Result).

interpret(89,  yes).       % ASCII 89  = 'Y'
interpret(121, yes).       % ASCII 121 = 'y'
interpret(78,  no).        % ASCII 78  = 'N'
interpret(110, no).        % ASCII 110 = 'n'

%This is the custom part of the program: the data.

intro :-
    write('This program will identify a character in'), nl,
    write('The Lord of the Rings.'),nl.

%possibilities
character_may_be(sauron) :-
    user_says(big_eye, yes).

character_may_be(witch_king) :-
    user_says(big_eye, no),
    user_says(alive, no),
    user_says(leader_of_nazgul, yes).

character_may_be(leader_of_the_dead) :-
    user_says(big_eye, no),
    user_says(alive, no),
    user_says(leader_of_nazgul, no).

character_may_be(saruman) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, yes),
    user_says(works_for_sauron, yes).

character_may_be(gandalf) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, yes),
    user_says(works_for_sauron, no).

character_may_be(lurtz) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, yes).

character_may_be(gothmog) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, yes).

character_may_be(fell_beast) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, yes),
    user_says(dragon_like, yes).

character_may_be(shelob) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, yes),
    user_says(dragon_like, no),
    user_says(spider, yes).

character_may_be(balrog) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, yes),
    user_says(dragon_like, no),
    user_says(spider, no).
    
character_may_be(elrond) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, yes),
    user_says(female, no),
    user_says(dark_hair, yes),
    user_says(father_of_arwen, yes).

character_may_be(figwit) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, yes),
    user_says(female, no),
    user_says(dark_hair, yes),
    user_says(father_of_arwen, no).

character_may_be(legolas) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, yes),
    user_says(female, no),
    user_says(dark_hair, no).

character_may_be(arwen) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, yes),
    user_says(female, yes),
    user_says(dark_hair, yes).

character_may_be(galadriel) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, yes),
    user_says(female, yes),
    user_says(dark_hair, no).

character_may_be(gimli) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, yes).

character_may_be(rosie) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, yes),
    user_says(female, yes).

character_may_be(frodo) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, yes),
    user_says(female, no),
    user_says(at_mount_doom, yes),
    user_says(member_of_fellowship, yes),
    user_says(dark_hair, yes).

character_may_be(sam) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, yes),
    user_says(female, no),
    user_says(at_mount_doom, yes),
    user_says(member_of_fellowship, yes),
    user_says(dark_hair, no).

character_may_be(smeagol) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, yes),
    user_says(female, no),
    user_says(at_mount_doom, yes),
    user_says(member_of_fellowship, no).

character_may_be(pippin) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, yes),
    user_says(female, no),
    user_says(at_mount_doom, no),
    user_says(accent, yes).

character_may_be(merry) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, yes),
    user_says(female, no),
    user_says(at_mount_doom, no),
    user_says(accent, no).

character_may_be(eowyn) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, no),
    user_says(human, yes),
    user_says(female, yes).

character_may_be(aragorn) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, no),
    user_says(human, yes),
    user_says(female, no),
    user_says(dark_hair, yes),
    user_says(member_of_fellowship, yes).

character_may_be(grima_wormtongue) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, no),
    user_says(human, yes),
    user_says(female, no),
    user_says(dark_hair, yes),
    user_says(member_of_fellowship, no),
    user_says(works_for_saruman, yes).

character_may_be(denethor_ii) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, no),
    user_says(human, yes),
    user_says(female, no),
    user_says(dark_hair, yes),
    user_says(member_of_fellowship, no),
    user_says(works_for_saruman, no).

character_may_be(boromir) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, no),
    user_says(human, yes),
    user_says(female, no),
    user_says(dark_hair, no),
    user_says(son_of_denethor, yes),
    user_says(member_of_fellowship, yes).

character_may_be(faramir) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, no),
    user_says(human, yes),
    user_says(female, no),
    user_says(dark_hair, no),
    user_says(son_of_denethor, yes),
    user_says(member_of_fellowship, no).

character_may_be(theoden) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, no),
    user_says(human, yes),
    user_says(female, no),
    user_says(dark_hair, no),
    user_says(son_of_denethor, no),
    user_says(king_of_rohan, yes).

character_may_be(eomir) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, no),
    user_says(human, yes),
    user_says(female, no),
    user_says(dark_hair, no),
    user_says(son_of_denethor, no),
    user_says(king_of_rohan, no).

character_may_be(treebeard) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, no),
    user_says(human, no),
    user_says(ent, yes).

character_may_be(unknown) :-
    user_says(big_eye, no),
    user_says(alive, yes),
    user_says(wizard, no),
    user_says(uruk-hai, no),
    user_says(orc, no),
    user_says(animal, no),
    user_says(elf, no),
    user_says(dwarf, no),
    user_says(hobbit, no),
    user_says(human, no),
    user_says(ent, no).
    
%Text of the questions

ask_question(big_eye) :-
    write('Is the character a big eye? '), nl.

ask_question(alive) :-
    write('Is the character alive? '), nl.

ask_question(wizard) :-
    write('Is the character a wizard? '), nl.

ask_question(works_for_sauron) :-
    write('Does the character work for Sauron? '), nl.

ask_question(uruk-hai) :-
    write('Is the character an Uruk-hai? '), nl.

ask_question(orc) :-
    write('Is the character an orc? '), nl.

ask_question(animal) :-
    write('Is the character an animal? '), nl.

ask_question(dragon_like) :-
    write('Does the character look sort of like a dragon? '), nl.
    
ask_question(spider) :-
    write('Is the character a large spider? '), nl.

ask_question(elf) :-
    write('Is the character an elf? '), nl.

ask_question(female) :-
    write('Is the character female? '), nl.

ask_question(dark_hair) :-
    write('Does the character have dark hair? '), nl.

ask_question(father_of_arwen) :-
    write('Is the character the father of Arwen? '), nl.

ask_question(dwarf) :-
    write('Is the character a dwarf? '), nl.

ask_question(hobbit) :-
    write('Is the character a hobbit? '), nl.

ask_question(at_mount_doom) :-
    write('Did the character make it all the way to Mount Doom?'), nl.

ask_question(member_of_fellowship) :-
    write('Is the character a member of the Fellowship? '), nl.

ask_question(accent) :-
    write('Does the character have an accent? '), nl.

ask_question(human) :-
    write('Is the character a human? '), nl.

ask_question(works_for_saruman) :-
    write('Does the character work for Saruman? '), nl.

ask_question(son_of_denethor) :-
    write('Is the character a son of Denethor II? '), nl.

ask_question(king_of_rohan) :-
    write('Was the character a king of Rohan? '), nl.

ask_question(ent) :-
    write('Is the character an ent? '), nl.

ask_question(leader_of_nazgul) :-
    write('Is the character the leader of the nazgul? '), nl.


%Details for the characters
details(sauron) :-
    nl,
    write('The character is Sauron. He forged the One Ring of Power'), nl,
    write('in the fires of Mount Doom. He waged a war against all'), nl,
    write('of Middle Earth to become ruler of Middle Earth.'), nl.

details(saruman) :-
    write('The character is Saruman. He was a white wizard, and'), nl,
    write('worked for Sauron. Saruman built up an army of Uruk-Hai'), nl,
    write('to assist Sauron in the war against Middle Earth.'), nl.

details(gandalf) :-
    write('The character is Gandalf. He was a grey wizard at the'), nl,
    write('beginning of the trilogy, and a white wizard after the'), nl,
    write('battle with the balrog.'), nl.

details(lurtz) :-
    write('The character is Lurtz. He was the leader of the Uruk-Hai,'), nl,
    write('creatures made by Saruman.'), nl.

details(gothmog) :-
    write('The character is Gothmog. He was the leader of the orcs'), nl,
    write('in the battle at Gondor.'), nl.

details(fell_beast) :-
    write('The character is a fell beast. These are what the Nazgul'), nl,
    write('rode on after the horses were killed by Arwen.'), nl.

details(shelob) :-
    write('The character is Shelob. She ate anything that crossed her'), nl,
    write('path, except for Smeagol, who made an alliance with her:'), nl, 
    write('Smeagol would bring Frodo and Sam to her, and he would get'), nl,
    write('the One Ring of Power.'), nl.

details(balrog) :-
    write('The character is Durin''s Bane, a Balrog of Moria. He'), nl,
    write('and Galdalf the Grey fought to a mutual death, although'), nl,
    write('Gandalf was sent back to Middle Earth as Gandalf the White.'), nl.

details(arwen) :-
    write('The character is Arwen. She is the daughter of Elrond, '), nl,
    write('ruler of Rivendell. She married Aragorn after the One'), nl,
    write('Ring of Power had been destroyed.'), nl.

details(galadriel) :-
    write('The character is Galadriel. She ruled Lothlorien with her'), nl,
    write('husband, Lord Celeborn. Gave each member of the Fellowship'), nl,
    write('a gift when they left Rivendell.'), nl.

details(elrond) :-
    write('The character is Elrond. He was the ruler of Rivendell'), nl,
    write('at the time of the formation of the Fellowship of the'), nl,
    write('Ring. He was the father of Arwen.'), nl.

details(figwit) :-
    write('The character is Figwit. He was the elf that was escorting'), nl,
    write('Arwen on her journey to the undying lands. His name is'), nl,
    write('an acronym, and stands for "Frodo Is Great, Who Is That?".'), nl.

details(legolas) :-
    write('The character is Legolas. He was highly skilled with a'), nl,
    write('bow and arrow. He and Gimli had contests to see who '), nl,
    write('would kill more orcs or uruk-hai at a battle.'), nl.

details(gimli) :-
    write('The character is Gimli, son of Gloin. He was the only dwarf'), nl,
    write('to have a main part in the Lord of the Rings trilogy.'), nl,
    write('During the meeting to decide the fate of the One Ring'), nl,
    write('of Power, he displayed open hostility for the elves.'), nl.

details(rosie) :-
    write('The character is Rosie. She married Sam when he got back'), nl,
    write('from destroying the One Ring of Power.'), nl.

details(frodo) :-
    write('The character is Frodo. He carried the One Ring of Power'), nl,
    write('all the way to Rivendell, and then simply walked into'), nl,
    write('Mordor with it. Having resisted the power of the Ring'), nl,
    write('up to this point, he tried to claim it as it own just'), nl,
    write('before he cast it into the lava of Mount Doom.'), nl.

details(sam) :-
    write('The character is Sam. He stuck with Frodo all the way'), nl,
    write('into Mordor, to the interior of Mount Doom, with only'), nl,
    write('brief periods apart. He always did his best to protect'), nl,
    write('Frodo.'), nl.

details(smeagol) :-
    write('The character is Smeagol, better known as Gollum, due'), nl,
    write('to the way he clears his throat. He lived with the Ring'), nl,
    write('for over 500 years, and eventually was the cause of the'), nl,
    write('destruction of the Ring.'), nl.

details(pippin) :-
    write('The character is Pippin. He had a habbit of getting'), nl,
    write('himself and the rest of the fellowship into trouble.'), nl,
    write('He saved Faramir from being killed.'), nl.

details(merry) :-
    write('The character is Merry. He was a friend of Pippin, and'), nl,
    write('was only separated from Pippin when Pippin was taken by'), nl,
    write('Gandalf to Gondor.'), nl.

details(eowyn) :-
    nl,
    write('The character is Eowyn. She was the daughter of Theoden,'), nl,
    write('King of Rohan. She married Faramir, son of Denethor II.'), nl.

details(aragorn) :-
    write('The character is Aragorn, Son of Arathorn. He lived over'), nl,
    write('eighty years as a Ranger, before he became part of the'), nl,
    write('fellowship of the ring. He later became the King of Gondor.'), nl.

details(grima_wormtongue) :-
    write('The character is Grima Wormtongue. He was the advisor'), nl,
    write('to King Theoden, until Gandalf revealed that Grima was'), nl,
    write('working for Sauron.'), nl.

details(denethor_ii) :-
    write('The character is Denethor II. He was the Steward of Gondor'), nl,
    write('at the time of the rise of Sauron.'), nl.

details(boromir) :-
    write('The character is Boromir. He was a son of Denethor II,'), nl,
    write('Steward of Gondor. He was the first main character'), nl,
    write('to die in the Lord of the Rings trilogy.'), nl.

details(faramir) :-
    write('The character is Faramir. He was a son of Denethor II,'), nl, 
    write('Steward of Gondor. He married Eowyn after the One Ring'), nl,
    write('of Power was destroyed.'), nl.

details(theoden) :-
    write('The character is Theoden. He was the King of Rohan at the'), nl,
    write('time of the rise of Sauron. He was the father of three'), nl,
    write('other characters, two of which were main characters:'), nl,
    write('Eowyn and Eomir.'), nl.

details(eomir) :-
    write('The character is Eomir. He was the son of Theoden, King'), nl,
    write('of Rohan. He was the brother of Eowyn, and the leader of'), nl,
    write('the Eored.'), nl.

details(treebeard) :-
    write('The character is Treebeard. He was instructed by Gandalf'), nl,
    write('the White to protect Merry and Pippin. He led an army of'), nl,
    write('Ents into war against Saurman and took over Isengard.'), nl.

details(witch_king) :-
    write('The character is the Witch-king of Angmar. He was the'), nl,
    write('leader of the nine Nazgul, and was killed by Eowyn and'), nl,
    write('Merry.'), nl.

details(leader_of_the_dead) :-
    write('The character is the King of the Dead. He fought for'), nl,
    write('Aragorn in the battle at Gondor. He only fought for Aragorn'), nl,
    write('because Aragorn had the sword of Isildur, which had been'), nl,
    write('reforged by the elves.'), nl.

details(unknown) :-
    write('The character cannot be found.'), nl.

