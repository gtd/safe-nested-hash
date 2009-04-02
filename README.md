# SafeNestedHash

Allows you to populate nested hashes without initializing every level first:

    >> h = SafeNestedHash.new
    >> h[1][2][3] = :foo
    >> h
    => {1 => {2 => {3 => :foo}}}

Don't be tempted by more concise implementations such as can be found at http://www.ruby-forum.com/topic/111524.  The fundamental challenge to overcome here is that accessing a non-existent key should not alter the original hash, yet setting a deeply nested hash needs to attach to the original hash (potentially) several levels up.  This is accomplished by means of a custom UndefinedHash class which tracks lookup path and reconstructs it if an assignment is found at the end: 

    h = SafeNestedHash.new
    h[1]
    => #<SafeNestedHash::UndefinedHash:0x473d648 @first_key=1, @base={}, @keychain=[]>

    h = SafeNestedHash.new
    h[1][2][3]
    => #<SafeNestedHash::UndefinedHash:0x473bca8 @first_key=1, @base={}, @keychain=[2, 3]>

    h = SafeNestedHash.new
    h[1][2][3] = :foo
    h[1][2][4][5][6]
    => #<SafeNestedHash::UndefinedHash:0x4737464 @first_key=4, @base={3=>:foo}, @keychain=[5, 6]>
    h
    => {1=>{2=>{3=>:foo}}}

To check for existence of a key you must use nil?.  Smelly I know, and you can't trivially differentiate from an actual nil stored in the hash, but look Ma, no monkey patching:

    h = SafeNestedHash.new
    h[1][2][3] = :foo
    h[1][2][3].nil?
    => false
    h[2].nil?
    => true
    h[2][3].nil?
    => true

== Copyright

Copyright (c) 2009 Gabe da Silveira. See LICENSE for details.
