# TEvo Challenge - Francis Rocco

## February 2, 2017

### Challenge: Minimal Times of Presses on Keypads

Design an efficient algorithm to lay out presses on phone keypads in order to minimize the number of presses.

The current phone keypads usually looks like the following layout:

key 2: abc
key 3: def
key 4: ghi
key 5: jkl
key 6: mno
key 7: pqrs
key 8: tuv
key 9: wxyz

The first press of a key types the first letter. Each subsequent press advances to the next letter. For example, to type the word “cat”, we have to press key 2 three times, followed by the key 2 once, followed by the key 8 once. The total number of key presses is 5. This typical layout is not an efficient one. The letter “i” is used much more frequently than the letter ‘w’ in English. However, we have to press the 4 key three times to get an ‘i’, and press the 9 key only once to get a ‘w’. If these two letters are interchanged on the keypad, it will reduce the overall press count. Design an program that will result with an efficient layout and supply tests to prove your program is correct.

### To Run:

1. Fork and Clone -OR- Download this repository
2. Open Terminal and cd into this repository
3. In Terminal, enter "ruby run_francis_rocco.rb"
4. Tests can be seen by entering "rspec spec"

### Approach:

1. I first decided I needed to map some text to a hash to count the frequency of letters in a given piece of text. I could have just looked up the most frequently used letters in the English language on Google but I thought it could be more fun to find out for myself.

2. My program is set up so any file can be used within the run method. I could have used a large book like War and Peace, which would have been a very good representation of the frequency of English language letters but I decided to go with two, shorter works instead. One is a transcript of Chimamanda Ngozi Adichie's TED talk, *"We Should All Be Feminists"* [[source]] (https://vialogue.wordpress.com/2013/12/30/ted-we-should-all-be-feminists-chimamanda-ngozi-adichie-at-tedxeuston-transcript/). The other is a transcript of Michelle Obama's Commencement Speech at City College's 2017 Graduation [[source]](https://obamawhitehouse.archives.gov/the-press-office/2016/06/03/remarks-first-lady-city-college-new-york-commencement).

3. I then ordered the letters in descending order by frequency. My logic is that if a letter is most used, we want it to be the first option on a key to make the least amount of presses. If we then assign the 8 most frequently used letters to the numbers 2-9, they will use only 1 key press. We then assign the next 8 letters to the numbers 2-9 for two presses each, etc.

### Result:

Current result with included text samples is:

2: ehg
3: tlf
4: adp
5: oub
6: imv
7: nwk
8: syjq
9: rcxz

francis passes with 10 new presses vs. 19 classic presses
ticket evolution passes with 22 new presses vs. 34 classic presses
hire me passes with 8 new presses vs. 13 classic presses

NB: As noted in "Approach", two text files are included in this repository as English language speech examples. If one would like, one could use their own text files and change the "run_francis_rocco.rb" file line 3 to those changed files.

### Suggestions for Improvement:

1. My rspec tests have a few cases that can fall through the cracks. More specifc tests could be written.

2. `key_assign` method feels a little too brute force. I feel there is probably a more programatic way to map through my letter array and assign to a key. I can work on this moving forward.

3. `import_files` method is very specific to my example of two text files. I could turn the arguments into a splat to be able to use any amount of text files.
