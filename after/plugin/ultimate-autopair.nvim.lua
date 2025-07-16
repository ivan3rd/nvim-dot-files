 require('ultimate-autopair').setup{
   profile='default',
   pair_map=true, --whether to allow pair insert map
   cmap=true, --cmap stands for cmd-line map
   bs={-- *ultimate-autopair-map-backspace-config*
     enable=true,
     map='<bs>', --string or table
     cmap='<bs>', --string or table
     overjumps=true,
     --(|foo) > bs > |foo
     space=true, --false, true or 'balance'
     --( |foo ) > bs > (|foo)
     --balance:
     --  Will prioritize balanced spaces
     --  ( |foo  ) > bs > ( |foo )
     indent_ignore=false,
     --(\n\t|\n) > bs > (|)
     single_delete=false,
     -- <!--|--> > bs > <!-|
     conf={},
     --contains extension config
     multi=false,
     --use multiple configs (|ultimate-autopair-map-multi-config|)
   },
   cr={-- *ultimate-autopair-map-newline-config*
     enable=true,
     map='<cr>', --string or table
     autoclose=false,
     --(| > cr > (\n|\n)
     conf={cond=function(fn) return not fn.in_lisp() end},
     --contains extension config
     multi=false,--use multiple configs (|ultimate-autopair-map-multi-config|)
   },
   multiline=true, --whether to allow pair cmd-line map
     fastwarp={
         multi=false,
         {},
         {faster=true,map='<C-A-e>',cmap='<C-A-e>'},
     },
   tabout={-- *ultimate-autopair-map-tabout-config*
     enable=true,
     map='<A-tab>', --string or table
     cmap='<A-tab>', --string or table
     conf={},
     --contains extension config
     multi=false,
     --use multiple configs (|ultimate-autopair-map-multi-config|)
     hopout=false,
     -- (|) > tabout > ()|
     do_nothing_if_fail=true,
     --add a module so that if close fails
     --then a `\t` will not be inserted
   },
   internal_pairs={-- *ultimate-autopair-pairs-default-pairs*
     {'[',']',fly=true,dosuround=true,newline=true,space=true},
     {'(',')',fly=true,dosuround=true,newline=true,space=true},
     {'{','}',fly=false,dosuround=false,newline=true,space=true},
     {'"','"',suround=true,multiline=false},
     {"'","'",suround=true,cond=function(fn) return not fn.in_lisp() or fn.in_string() end,alpha=true,nft={'tex'},multiline=false},
     {'`','`',cond=function(fn) return not fn.in_lisp() or fn.in_string() end,nft={'tex'},multiline=false},
     {'``',"''",ft={'tex'}},
     {'```','```',newline=true,ft={'markdown'}},
     {'<!--','-->',ft={'markdown','html'},space=true},
     {'"""','"""',newline=true,ft={'python'}},
     {"'''","'''",newline=true,ft={'python'}},
   },
 }
