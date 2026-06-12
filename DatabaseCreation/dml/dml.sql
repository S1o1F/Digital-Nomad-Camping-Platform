
<!DOCTYPE html>
<html lang="en">   <head>
    <!-- # block head (placeholder in theme.html) -->
        <!-- # block head (content inherited from layout.html) -->
    <title>
dml.sql on DatabaseCreation – Attachment          – camper

    </title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!--[if IE]><script>
        if (/^#__msie303:/.test(window.location.hash))
        window.location.replace(window.location.hash.replace(/^#__msie303:/, '#'));
        </script><![endif]-->

    <link rel="start"  href="/projects/camper/wiki" />
    <link rel="search"  href="/projects/camper/search" />
    <link rel="help"  href="/projects/camper/wiki/TracGuide" />
    <link rel="stylesheet"  href="/projects/camper/chrome/common/css/trac.css" type="text/css" />
    <link rel="stylesheet"  href="/projects/camper/chrome/common/css/code.css" type="text/css" />
    <link rel="stylesheet"  href="/projects/camper/chrome/wikiautocomplete/css/jquery.textcomplete.css" type="text/css" />
    <link rel="icon"  href="/projects/camper/chrome/common/trac.ico" type="image/x-icon" />
    <link rel="up"  href="/projects/camper/wiki/DatabaseCreation" title="DatabaseCreation" />
    <link rel="alternate"  href="/projects/camper/raw-attachment/wiki/DatabaseCreation/dml.sql" title="Original Format" type="text/x-sql; charset=utf-8" />
    <noscript>
      <style>
        .trac-noscript { display: none !important }
      </style>     </noscript>
    <link type="application/opensearchdescription+xml" rel="search"
          href="/projects/camper/search/opensearch"
          title="Search camper"/>
    <script>
      var wikiautocomplete={"strategies":[{"cache":true,"index":2,"match":"^(\\s*\\{{3}#!)(.*)(?!\\n)$","match_flags":"m","name":"processor","replace_prefix":"$1"},{"cache":false,"index":2,"match":"(\\b(?:raw-)?attachment:|\\[\\[Image\\()(\\S*)$","name":"attachment","quote_whitespace":true,"replace_prefix":"$1"},{"cache":true,"index":2,"match":"(^|[^[])\\[(\\w*)$","name":"linkresolvers","replace_end":"]","replace_prefix":"$1[","replace_suffix":":"},{"cache":false,"index":2,"match":"((?:^|[^{])#|\\bticket:|\\bbug:|\\bissue:)(\\d*)$","name":"ticket","replace_prefix":"$1","template_prefix":"#"},{"cache":true,"index":1,"match":"\\bwiki:(\\S*)$","name":"wikipage","quote_whitespace":true,"replace_prefix":"wiki:"},{"cache":true,"index":1,"match":"\\[\\[(\\w*)(?:\\(([^)]*))?$","name":"macro","replace_end":")]]","replace_prefix":"[[","replace_suffix":"($2"},{"cache":false,"index":2,"match":"\\b(source:|browser:|repos:|log:|export:)([^@\\s]*(?:@\\S*)?)$","name":"source","replace_prefix":"$1"},{"cache":true,"index":1,"match":"\\bmilestone:(\\S*)$","name":"milestone","quote_whitespace":true,"replace_prefix":"milestone:"},{"cache":true,"index":2,"match":"(^|[^{])\\{(\\d*)$","name":"report","replace_end":"}","replace_prefix":"$1{","template_prefix":"{","template_suffix":"}"},{"cache":true,"index":1,"match":"\\breport:(\\d*)$","name":"report","replace_prefix":"report:","template_prefix":"{","template_suffix":"}"}],"url":"/projects/camper/wikiautocomplete"};
    </script>
    <script src="/projects/camper/chrome/common/js/jquery.js"></script>
    <script src="/projects/camper/chrome/common/js/babel.js"></script>
    <script src="/projects/camper/chrome/common/js/trac.js"></script>
    <script src="/projects/camper/chrome/common/js/search.js"></script>
    <script src="/projects/camper/chrome/common/js/folding.js"></script>
    <script src="/projects/camper/chrome/wikiautocomplete/js/jquery.textcomplete.min.js"></script>
    <script src="/projects/camper/chrome/wikiautocomplete/js/wikiautocomplete.js"></script>
    <script>
      jQuery(function($) {
        $(".trac-autofocus").focus();
        $(".trac-target-new").attr("target", "_blank");
        if ($.ui) { /* is jquery-ui added? */
          $(".trac-datepicker:not([readonly])")
            .prop("autocomplete", "off").datepicker();
          // Input current date when today is pressed.
          var _goToToday = $.datepicker._gotoToday;
          $.datepicker._gotoToday = function(id) {
            _goToToday.call(this, id);
            this._selectDate(id)
          };
          $(".trac-datetimepicker:not([readonly])")
            .prop("autocomplete", "off").datetimepicker();
        }
        $(".trac-disable").disableSubmit(".trac-disable-determinant");
        setTimeout(function() { $(".trac-scroll").scrollToTop() }, 1);
        $(".trac-disable-on-submit").disableOnSubmit();
      });
    </script>
    <!--   # include 'site_head.html' (layout.html) -->
    <!--   end of site_head.html -->
    <!-- # endblock head (content inherited from layout.html) -->

    <script>
      jQuery(function($) {
        $('#preview table.code').enableCollapsibleColumns(
          $('#preview table.code thead th.content'));
      });
    </script>
    <!-- # endblock head (placeholder in theme.html) -->
  </head> 
  <body>
    <!-- # block body (content inherited from theme.html) -->
    <!--   # include 'site_header.html' (theme.html) -->
    <!--   end of site_header.html -->

    <div id="banner">
      <div id="header">
        <a id="logo"
           href="/projects/camper">
          <img  alt="camper" height="53" src="/projects/camper/chrome/../raw-attachment/wiki/WikiStart/logo.png" /></a>


      </div>
      <form id="search" action="/projects/camper/search" method="get">
        <div>
          <label for="proj-search">Search:</label>
          <input type="text" id="proj-search" name="q" size="18"
                  value="" />
          <input type="submit" value="Search" />
        </div>
      </form>
          <div id="metanav" class="nav">
      <ul><li  class="first">Logged in as: 231012</li><li ><a href="/projects/camper/logout">Logout</a></li><li ><a href="/projects/camper/prefs">Preferences</a></li><li ><a href="/projects/camper/wiki/TracGuide">Help/Guide</a></li><li  class="last"><a href="/projects/camper/about">About Trac</a></li></ul>
    </div>

    </div>
        <div id="mainnav" class="nav">
      <ul><li  class="active first"><a href="/projects/camper/wiki">Wiki</a></li><li ><a href="/projects/camper/timeline">Timeline</a></li><li ><a href="/projects/camper/roadmap">Roadmap</a></li><li ><a href="/projects/camper/report">View Tickets</a></li><li ><a href="/projects/camper/newticket">New Ticket</a></li><li ><a href="/projects/camper/search">Search</a></li><li  class="last"><a href="/projects/camper/admin">Admin</a></li></ul>
    </div>


    <div id="main"
         >
      <div id="ctxtnav" class="nav">
        <h2>Context Navigation</h2>
        <ul>
          <li  class="first last"><a href="/projects/camper/wiki/DatabaseCreation">Back to DatabaseCreation</a></li>
        </ul>
        <hr />
      </div>

      

      

      <!-- # block content (placeholder in theme.html) -->
    <div id="content" class="attachment">

      <h1><a href="/projects/camper/wiki/DatabaseCreation">DatabaseCreation</a>:
        dml.sql</h1>
      <table id="info">
        <tr>
          <th scope="col">
File dml.sql,             <span title="35277 bytes">34.5 KB</span>
 (added by <span class="trac-author-user">231012</span>, <a class="timeline" href="/projects/camper/timeline?from=2026-06-12T20%3A14%3A08%2B02%3A00&amp;precision=second" title="See timeline at 06/12/26 20:14:08">4 hours ago</a>)          </th>
        </tr>
        <tr>
          <td class="message searchable">
            
          </td>
        </tr>
      </table>

      <div id="preview" class="searchable">

<table class="code"><thead><tr><th class="lineno" title="Line numbers">Line</th><th class="content"> </th></tr></thead><tbody><tr><th id="L1"><a href="#L1">1</a></th><td>--Inserti
</td></tr><tr><th id="L2"><a href="#L2">2</a></th><td>
</td></tr><tr><th id="L3"><a href="#L3">3</a></th><td>--1.User
</td></tr><tr><th id="L4"><a href="#L4">4</a></th><td>SELECT conname
</td></tr><tr><th id="L5"><a href="#L5">5</a></th><td>FROM pg_constraint
</td></tr><tr><th id="L6"><a href="#L6">6</a></th><td>WHERE conrelid = 'public."User"'::regclass
</td></tr><tr><th id="L7"><a href="#L7">7</a></th><td>AND contype = 'u';
</td></tr><tr><th id="L8"><a href="#L8">8</a></th><td>
</td></tr><tr><th id="L9"><a href="#L9">9</a></th><td>ALTER TABLE "User" ALTER COLUMN ssn DROP NOT NULL;
</td></tr><tr><th id="L10"><a href="#L10">10</a></th><td>CREATE TEMP TABLE first_names(name text);
</td></tr><tr><th id="L11"><a href="#L11">11</a></th><td>CREATE TEMP TABLE last_names(surname text);
</td></tr><tr><th id="L12"><a href="#L12">12</a></th><td>
</td></tr><tr><th id="L13"><a href="#L13">13</a></th><td>INSERT INTO first_names VALUES
</td></tr><tr><th id="L14"><a href="#L14">14</a></th><td>('James'), ('Mary'), ('John'), ('Patricia'), ('Robert'),
</td></tr><tr><th id="L15"><a href="#L15">15</a></th><td>('Jennifer'), ('Michael'), ('Linda'), ('William'), ('Elizabeth'),
</td></tr><tr><th id="L16"><a href="#L16">16</a></th><td>('David'), ('Barbara'), ('Richard'), ('Susan'), ('Joseph'),
</td></tr><tr><th id="L17"><a href="#L17">17</a></th><td>('Jessica'), ('Thomas'), ('Sarah'), ('Charles'), ('Karen'),
</td></tr><tr><th id="L18"><a href="#L18">18</a></th><td>('Christopher'), ('Nancy'), ('Daniel'), ('Lisa'), ('Matthew'),
</td></tr><tr><th id="L19"><a href="#L19">19</a></th><td>('Betty'), ('Anthony'), ('Margaret'), ('Mark'), ('Sandra'),
</td></tr><tr><th id="L20"><a href="#L20">20</a></th><td>('Donald'), ('Ashley'), ('Steven'), ('Kimberly'), ('Paul'),
</td></tr><tr><th id="L21"><a href="#L21">21</a></th><td>('Emily'), ('Andrew'), ('Donna'), ('Joshua'), ('Michelle'),
</td></tr><tr><th id="L22"><a href="#L22">22</a></th><td>('Kenneth'), ('Dorothy'), ('Kevin'), ('Carol'), ('Brian'),
</td></tr><tr><th id="L23"><a href="#L23">23</a></th><td>('Amanda'), ('George'), ('Melissa'), ('Edward'), ('Deborah'),
</td></tr><tr><th id="L24"><a href="#L24">24</a></th><td>('Ronald'), ('Stephanie'), ('Timothy'), ('Rebecca'), ('Jason'),
</td></tr><tr><th id="L25"><a href="#L25">25</a></th><td>('Laura'), ('Jeffrey'), ('Helen'), ('Ryan'), ('Sharon');
</td></tr><tr><th id="L26"><a href="#L26">26</a></th><td>
</td></tr><tr><th id="L27"><a href="#L27">27</a></th><td>INSERT INTO last_names VALUES
</td></tr><tr><th id="L28"><a href="#L28">28</a></th><td>('Smith'), ('Johnson'), ('Williams'), ('Brown'), ('Jones'),
</td></tr><tr><th id="L29"><a href="#L29">29</a></th><td>('Garcia'), ('Miller'), ('Davis'), ('Rodriguez'), ('Martinez'),
</td></tr><tr><th id="L30"><a href="#L30">30</a></th><td>('Hernandez'), ('Lopez'), ('Gonzalez'), ('Wilson'), ('Anderson'),
</td></tr><tr><th id="L31"><a href="#L31">31</a></th><td>('Thomas'), ('Taylor'), ('Moore'), ('Jackson'), ('Martin'),
</td></tr><tr><th id="L32"><a href="#L32">32</a></th><td>('Lee'), ('Perez'), ('Thompson'), ('White'), ('Harris'),
</td></tr><tr><th id="L33"><a href="#L33">33</a></th><td>('Sanchez'), ('Clark'), ('Ramirez'), ('Lewis'), ('Robinson'),
</td></tr><tr><th id="L34"><a href="#L34">34</a></th><td>('Walker'), ('Young'), ('Allen'), ('King'), ('Wright'),
</td></tr><tr><th id="L35"><a href="#L35">35</a></th><td>('Scott'), ('Torres'), ('Nguyen'), ('Hill'), ('Flores'),
</td></tr><tr><th id="L36"><a href="#L36">36</a></th><td>('Green'), ('Adams'), ('Nelson'), ('Baker'), ('Hall'),
</td></tr><tr><th id="L37"><a href="#L37">37</a></th><td>('Rivera'), ('Campbell'), ('Mitchell'), ('Carter'), ('Roberts'),
</td></tr><tr><th id="L38"><a href="#L38">38</a></th><td>('Gomez'), ('Phillips'), ('Evans'), ('Turner'), ('Diaz'),
</td></tr><tr><th id="L39"><a href="#L39">39</a></th><td>('Parker'), ('Cruz'), ('Edwards'), ('Collins'), ('Reyes');
</td></tr><tr><th id="L40"><a href="#L40">40</a></th><td>
</td></tr><tr><th id="L41"><a href="#L41">41</a></th><td>create table if not exists temp_ssn (
</td></tr><tr><th id="L42"><a href="#L42">42</a></th><td>    id bigserial primary key,
</td></tr><tr><th id="L43"><a href="#L43">43</a></th><td>    ssn varchar(13)
</td></tr><tr><th id="L44"><a href="#L44">44</a></th><td>);
</td></tr><tr><th id="L45"><a href="#L45">45</a></th><td>
</td></tr><tr><th id="L46"><a href="#L46">46</a></th><td>insert into temp_ssn (ssn)
</td></tr><tr><th id="L47"><a href="#L47">47</a></th><td>select
</td></tr><tr><th id="L48"><a href="#L48">48</a></th><td>    to_char(data.date_birth, 'DDMM') ||
</td></tr><tr><th id="L49"><a href="#L49">49</a></th><td>    to_char(extract(year from data.date_birth)::integer % 1000, 'FM099') ||
</td></tr><tr><th id="L50"><a href="#L50">50</a></th><td>    '4' || place || gender ||
</td></tr><tr><th id="L51"><a href="#L51">51</a></th><td>    to_char(number, 'FM099') as ssn
</td></tr><tr><th id="L52"><a href="#L52">52</a></th><td>from (
</td></tr><tr><th id="L53"><a href="#L53">53</a></th><td>    select
</td></tr><tr><th id="L54"><a href="#L54">54</a></th><td>        (now() - interval '70 years' * random())::date as date_birth,
</td></tr><tr><th id="L55"><a href="#L55">55</a></th><td>        (1 + random()*8)::integer as place,
</td></tr><tr><th id="L56"><a href="#L56">56</a></th><td>        (random()*5)::integer as gender,
</td></tr><tr><th id="L57"><a href="#L57">57</a></th><td>        (random()*100)::integer as number
</td></tr><tr><th id="L58"><a href="#L58">58</a></th><td>    from generate_series(1, 200000) s(i)
</td></tr><tr><th id="L59"><a href="#L59">59</a></th><td>) as data;
</td></tr><tr><th id="L60"><a href="#L60">60</a></th><td>
</td></tr><tr><th id="L61"><a href="#L61">61</a></th><td>INSERT INTO "User" (
</td></tr><tr><th id="L62"><a href="#L62">62</a></th><td>    name, surname, email, telephone_num, date_registration, type
</td></tr><tr><th id="L63"><a href="#L63">63</a></th><td>)
</td></tr><tr><th id="L64"><a href="#L64">64</a></th><td>SELECT
</td></tr><tr><th id="L65"><a href="#L65">65</a></th><td>    (SELECT name FROM first_names ORDER BY random() + gs.n LIMIT 1),
</td></tr><tr><th id="L66"><a href="#L66">66</a></th><td>    (SELECT surname FROM last_names ORDER BY random() + gs.n LIMIT 1),
</td></tr><tr><th id="L67"><a href="#L67">67</a></th><td>    lower(
</td></tr><tr><th id="L68"><a href="#L68">68</a></th><td>        (SELECT name FROM first_names ORDER BY random() + gs.n LIMIT 1)
</td></tr><tr><th id="L69"><a href="#L69">69</a></th><td>        || '.' ||
</td></tr><tr><th id="L70"><a href="#L70">70</a></th><td>        (SELECT surname FROM last_names ORDER BY random() + gs.n LIMIT 1)
</td></tr><tr><th id="L71"><a href="#L71">71</a></th><td>        || gs.n || '@example.com'
</td></tr><tr><th id="L72"><a href="#L72">72</a></th><td>    ),
</td></tr><tr><th id="L73"><a href="#L73">73</a></th><td>    '+3897' || (100000 + (random()*899999)::int),
</td></tr><tr><th id="L74"><a href="#L74">74</a></th><td>    CURRENT_DATE - ((random()*3650)::int),
</td></tr><tr><th id="L75"><a href="#L75">75</a></th><td>    CASE
</td></tr><tr><th id="L76"><a href="#L76">76</a></th><td>        WHEN random() &lt; 0.5 THEN 'guest'
</td></tr><tr><th id="L77"><a href="#L77">77</a></th><td>        ELSE 'host'
</td></tr><tr><th id="L78"><a href="#L78">78</a></th><td>    END
</td></tr><tr><th id="L79"><a href="#L79">79</a></th><td>FROM generate_series(1, 200000) gs(n);
</td></tr><tr><th id="L80"><a href="#L80">80</a></th><td>
</td></tr><tr><th id="L81"><a href="#L81">81</a></th><td>UPDATE "User"
</td></tr><tr><th id="L82"><a href="#L82">82</a></th><td>SET email = lower(name || '.' || surname || user_id || '@example.com');
</td></tr><tr><th id="L83"><a href="#L83">83</a></th><td>
</td></tr><tr><th id="L84"><a href="#L84">84</a></th><td>WITH shuffled_ssn AS (
</td></tr><tr><th id="L85"><a href="#L85">85</a></th><td>    SELECT ssn,
</td></tr><tr><th id="L86"><a href="#L86">86</a></th><td>           row_number() OVER (ORDER BY random()) AS rn
</td></tr><tr><th id="L87"><a href="#L87">87</a></th><td>    FROM temp_ssn
</td></tr><tr><th id="L88"><a href="#L88">88</a></th><td>),
</td></tr><tr><th id="L89"><a href="#L89">89</a></th><td>numbered_users AS (
</td></tr><tr><th id="L90"><a href="#L90">90</a></th><td>    SELECT user_id,
</td></tr><tr><th id="L91"><a href="#L91">91</a></th><td>           row_number() OVER (ORDER BY user_id) AS rn
</td></tr><tr><th id="L92"><a href="#L92">92</a></th><td>    FROM "User"
</td></tr><tr><th id="L93"><a href="#L93">93</a></th><td>)
</td></tr><tr><th id="L94"><a href="#L94">94</a></th><td>UPDATE "User" u
</td></tr><tr><th id="L95"><a href="#L95">95</a></th><td>SET ssn = s.ssn
</td></tr><tr><th id="L96"><a href="#L96">96</a></th><td>FROM numbered_users nu
</td></tr><tr><th id="L97"><a href="#L97">97</a></th><td>JOIN shuffled_ssn s ON nu.rn = s.rn
</td></tr><tr><th id="L98"><a href="#L98">98</a></th><td>WHERE u.user_id = nu.user_id;
</td></tr><tr><th id="L99"><a href="#L99">99</a></th><td>
</td></tr><tr><th id="L100"><a href="#L100">100</a></th><td>DELETE
</td></tr><tr><th id="L101"><a href="#L101">101</a></th><td>FROM "User" u
</td></tr><tr><th id="L102"><a href="#L102">102</a></th><td>WHERE user_id NOT IN (
</td></tr><tr><th id="L103"><a href="#L103">103</a></th><td>    SELECT MIN(user_id)
</td></tr><tr><th id="L104"><a href="#L104">104</a></th><td>    FROM "User"
</td></tr><tr><th id="L105"><a href="#L105">105</a></th><td>    GROUP BY ssn
</td></tr><tr><th id="L106"><a href="#L106">106</a></th><td>);
</td></tr><tr><th id="L107"><a href="#L107">107</a></th><td>
</td></tr><tr><th id="L108"><a href="#L108">108</a></th><td>TRUNCATE TABLE "User" RESTART identity CASCADE;
</td></tr><tr><th id="L109"><a href="#L109">109</a></th><td>DROP TABLE IF EXISTS first_names;
</td></tr><tr><th id="L110"><a href="#L110">110</a></th><td>DROP TABLE IF EXISTS last_names;
</td></tr><tr><th id="L111"><a href="#L111">111</a></th><td>DROP TABLE IF EXISTS temp_ssn;
</td></tr><tr><th id="L112"><a href="#L112">112</a></th><td>
</td></tr><tr><th id="L113"><a href="#L113">113</a></th><td>SELECT * FROM "User" LIMIT 100;
</td></tr><tr><th id="L114"><a href="#L114">114</a></th><td>
</td></tr><tr><th id="L115"><a href="#L115">115</a></th><td>TRUNCATE TABLE "User" RESTART identity CASCADE;
</td></tr><tr><th id="L116"><a href="#L116">116</a></th><td>DROP TABLE IF EXISTS first_names;
</td></tr><tr><th id="L117"><a href="#L117">117</a></th><td>DROP TABLE IF EXISTS last_names;
</td></tr><tr><th id="L118"><a href="#L118">118</a></th><td>DROP TABLE IF EXISTS temp_ssn;
</td></tr><tr><th id="L119"><a href="#L119">119</a></th><td>
</td></tr><tr><th id="L120"><a href="#L120">120</a></th><td>--2. CampType ------------------------------------------------
</td></tr><tr><th id="L121"><a href="#L121">121</a></th><td>INSERT INTO CampType (type_name, description)
</td></tr><tr><th id="L122"><a href="#L122">122</a></th><td>VALUES
</td></tr><tr><th id="L123"><a href="#L123">123</a></th><td>('camp', 'Basic camping area for outdoor activities'),
</td></tr><tr><th id="L124"><a href="#L124">124</a></th><td>('bungalow', 'Wooden or luxury accommodation units'),
</td></tr><tr><th id="L125"><a href="#L125">125</a></th><td>('tent', 'Accommodation in a tent in nature');
</td></tr><tr><th id="L126"><a href="#L126">126</a></th><td>
</td></tr><tr><th id="L127"><a href="#L127">127</a></th><td>--3. EquipmentType---------------------------------------------------
</td></tr><tr><th id="L128"><a href="#L128">128</a></th><td>INSERT INTO EquipmentType (type_name, description)
</td></tr><tr><th id="L129"><a href="#L129">129</a></th><td>VALUES
</td></tr><tr><th id="L130"><a href="#L130">130</a></th><td>('Shelter Equipment', 'Equipment used for protection and sleeping outdoors'),
</td></tr><tr><th id="L131"><a href="#L131">131</a></th><td>('Sleeping Equipment', 'Items used for sleeping comfort and warmth'),
</td></tr><tr><th id="L132"><a href="#L132">132</a></th><td>('Cooking Equipment', 'Tools for preparing food outdoors'),
</td></tr><tr><th id="L133"><a href="#L133">133</a></th><td>('Lighting Equipment', 'Devices for illumination at night'),
</td></tr><tr><th id="L134"><a href="#L134">134</a></th><td>('Furniture', 'Portable outdoor furniture for camping'),
</td></tr><tr><th id="L135"><a href="#L135">135</a></th><td>('Safety Equipment', 'Emergency and protection gear'),
</td></tr><tr><th id="L136"><a href="#L136">136</a></th><td>('Adventure Equipment', 'Gear for hiking and outdoor activities'),
</td></tr><tr><th id="L137"><a href="#L137">137</a></th><td>('Water Equipment', 'Water storage and purification tools'),
</td></tr><tr><th id="L138"><a href="#L138">138</a></th><td>('Climbing Equipment', 'Gear used for climbing and vertical activities'),
</td></tr><tr><th id="L139"><a href="#L139">139</a></th><td>('Fishing Equipment', 'Tools and gear for fishing activities'),
</td></tr><tr><th id="L140"><a href="#L140">140</a></th><td>('Winter Equipment', 'Equipment for cold weather camping'),
</td></tr><tr><th id="L141"><a href="#L141">141</a></th><td>('Navigation Equipment', 'Tools for orientation and navigation like GPS and compasses'),
</td></tr><tr><th id="L142"><a href="#L142">142</a></th><td>('Hygiene Equipment', 'Items for personal hygiene in outdoor conditions'),
</td></tr><tr><th id="L143"><a href="#L143">143</a></th><td>('Entertainment Equipment', 'Gear for leisure and recreation during camping'),
</td></tr><tr><th id="L144"><a href="#L144">144</a></th><td>('Power Equipment', 'Portable energy sources like generators and solar panels'),
</td></tr><tr><th id="L145"><a href="#L145">145</a></th><td>('Repair Equipment', 'Tools for fixing and maintaining camping gear'),
</td></tr><tr><th id="L146"><a href="#L146">146</a></th><td>('Storage Equipment', 'Containers and bags for organizing equipment'),
</td></tr><tr><th id="L147"><a href="#L147">147</a></th><td>('Medical Equipment', 'Advanced medical and emergency care tools'),
</td></tr><tr><th id="L148"><a href="#L148">148</a></th><td>('Fire Equipment', 'Tools for fire starting and fire safety like matches and fire starters'),
</td></tr><tr><th id="L149"><a href="#L149">149</a></th><td>('Hiking Equipment', 'Essential gear for hiking and trekking activities'),
</td></tr><tr><th id="L150"><a href="#L150">150</a></th><td>('Cycling Equipment', 'Gear used for biking and cycling trips'),
</td></tr><tr><th id="L151"><a href="#L151">151</a></th><td>('Skiing Equipment', 'Equipment for snow skiing activities'),
</td></tr><tr><th id="L152"><a href="#L152">152</a></th><td>('Cooking Accessories', 'Small accessories used in outdoor food preparation'),
</td></tr><tr><th id="L153"><a href="#L153">153</a></th><td>('Camping Tools', 'General tools used for setting up and maintaining camp'),
</td></tr><tr><th id="L154"><a href="#L154">154</a></th><td>('Electronics Equipment', 'Electronic devices used in camping such as chargers and radios'),
</td></tr><tr><th id="L155"><a href="#L155">155</a></th><td>('Kids Equipment', 'Camping gear designed specifically for children'),
</td></tr><tr><th id="L156"><a href="#L156">156</a></th><td>('Pet Equipment', 'Equipment and accessories for pets during camping'),
</td></tr><tr><th id="L157"><a href="#L157">157</a></th><td>('Emergency Equipment', 'Critical survival and emergency response tools');
</td></tr><tr><th id="L158"><a href="#L158">158</a></th><td>
</td></tr><tr><th id="L159"><a href="#L159">159</a></th><td>
</td></tr><tr><th id="L160"><a href="#L160">160</a></th><td>--4. Service-----------------------------------------------------------
</td></tr><tr><th id="L161"><a href="#L161">161</a></th><td>INSERT INTO Service (service_name, description, additional_fee) VALUES
</td></tr><tr><th id="L162"><a href="#L162">162</a></th><td>('WiFi', 'Internet access service', 15.00),
</td></tr><tr><th id="L163"><a href="#L163">163</a></th><td>('Electricity', 'Power supply service (estimated monthly usage)', 60.00),
</td></tr><tr><th id="L164"><a href="#L164">164</a></th><td>('Water Supply', 'Cold and hot water utility', 20.00),
</td></tr><tr><th id="L165"><a href="#L165">165</a></th><td>('Heating', 'Central heating system usage', 50.00),
</td></tr><tr><th id="L166"><a href="#L166">166</a></th><td>('Air Conditioning', 'Cooling system usage and maintenance', 25.00),
</td></tr><tr><th id="L167"><a href="#L167">167</a></th><td>('Gas Supply', 'Gas utility for heating and cooking', 35.00),
</td></tr><tr><th id="L168"><a href="#L168">168</a></th><td>('Waste Collection', 'Garbage removal and processing service', 10.00),
</td></tr><tr><th id="L169"><a href="#L169">169</a></th><td>('Security Service', 'Building security and monitoring system', 40.00),
</td></tr><tr><th id="L170"><a href="#L170">170</a></th><td>('Maintenance Service', 'General building maintenance support', 30.00),
</td></tr><tr><th id="L171"><a href="#L171">171</a></th><td>('Cleaning Service', 'Regular cleaning of shared spaces', 18.00),
</td></tr><tr><th id="L172"><a href="#L172">172</a></th><td>('Parking', 'Assigned parking space usage', 45.00),
</td></tr><tr><th id="L173"><a href="#L173">173</a></th><td>('Elevator Service', 'Elevator maintenance and operation cost', 12.00),
</td></tr><tr><th id="L174"><a href="#L174">174</a></th><td>('Lighting', 'Common area electricity usage', 22.00),
</td></tr><tr><th id="L175"><a href="#L175">175</a></th><td>('Hot Water', 'Hot water system usage', 28.00),
</td></tr><tr><th id="L176"><a href="#L176">176</a></th><td>('Internet Upgrade', 'High-speed internet package upgrade', 25.00),
</td></tr><tr><th id="L177"><a href="#L177">177</a></th><td>('Laundry Service', 'Shared washing and drying facilities', 12.00),
</td></tr><tr><th id="L178"><a href="#L178">178</a></th><td>('Gym Access', 'Access to fitness facilities', 35.00),
</td></tr><tr><th id="L179"><a href="#L179">179</a></th><td>('Sauna Access', 'Use of sauna facilities', 20.00),
</td></tr><tr><th id="L180"><a href="#L180">180</a></th><td>('Swimming Pool Access', 'Access to pool facilities', 30.00),
</td></tr><tr><th id="L181"><a href="#L181">181</a></th><td>('Room Cleaning Extra', 'Deep cleaning service on request', 25.00),
</td></tr><tr><th id="L182"><a href="#L182">182</a></th><td>('Trash Room Pickup', 'Direct waste pickup from unit', 6.00),
</td></tr><tr><th id="L183"><a href="#L183">183</a></th><td>('Mail Handling', 'Receiving and handling mail/parcels', 4.00),
</td></tr><tr><th id="L184"><a href="#L184">184</a></th><td>('Visitor Parking', 'Temporary parking for guests', 10.00);
</td></tr><tr><th id="L185"><a href="#L185">185</a></th><td>
</td></tr><tr><th id="L186"><a href="#L186">186</a></th><td>
</td></tr><tr><th id="L187"><a href="#L187">187</a></th><td>--5. Availability------------------------------------------------------------
</td></tr><tr><th id="L188"><a href="#L188">188</a></th><td>INSERT INTO Availability (available_from_date, available_to_date, status)
</td></tr><tr><th id="L189"><a href="#L189">189</a></th><td>SELECT
</td></tr><tr><th id="L190"><a href="#L190">190</a></th><td>    from_date,
</td></tr><tr><th id="L191"><a href="#L191">191</a></th><td>    from_date + (1 + floor(random() * 14))::int,
</td></tr><tr><th id="L192"><a href="#L192">192</a></th><td>    CASE
</td></tr><tr><th id="L193"><a href="#L193">193</a></th><td>        WHEN random() &lt; 0.75 THEN 'available'
</td></tr><tr><th id="L194"><a href="#L194">194</a></th><td>        WHEN random() &lt; 0.9  THEN 'booked'
</td></tr><tr><th id="L195"><a href="#L195">195</a></th><td>        ELSE 'unavailable'
</td></tr><tr><th id="L196"><a href="#L196">196</a></th><td>    END
</td></tr><tr><th id="L197"><a href="#L197">197</a></th><td>FROM (
</td></tr><tr><th id="L198"><a href="#L198">198</a></th><td>    SELECT CURRENT_DATE + (floor(random() * 365))::int AS from_date
</td></tr><tr><th id="L199"><a href="#L199">199</a></th><td>    FROM generate_series(1, 2000000)
</td></tr><tr><th id="L200"><a href="#L200">200</a></th><td>) dates;
</td></tr><tr><th id="L201"><a href="#L201">201</a></th><td>
</td></tr><tr><th id="L202"><a href="#L202">202</a></th><td>
</td></tr><tr><th id="L203"><a href="#L203">203</a></th><td>--6. CampLocation---------------------------------------------
</td></tr><tr><th id="L204"><a href="#L204">204</a></th><td>INSERT INTO CampLocation (
</td></tr><tr><th id="L205"><a href="#L205">205</a></th><td>    CampTypetypeId, name, description, type,
</td></tr><tr><th id="L206"><a href="#L206">206</a></th><td>    max_guests, min_nights_stay, status, season,
</td></tr><tr><th id="L207"><a href="#L207">207</a></th><td>    opening_date, closing_date
</td></tr><tr><th id="L208"><a href="#L208">208</a></th><td>)
</td></tr><tr><th id="L209"><a href="#L209">209</a></th><td>SELECT
</td></tr><tr><th id="L210"><a href="#L210">210</a></th><td>    floor(random()*3 + 1)::int,
</td></tr><tr><th id="L211"><a href="#L211">211</a></th><td>    'Camp Location ' || n,
</td></tr><tr><th id="L212"><a href="#L212">212</a></th><td>    'Auto generated camping location #' || n,
</td></tr><tr><th id="L213"><a href="#L213">213</a></th><td>
</td></tr><tr><th id="L214"><a href="#L214">214</a></th><td>    (ARRAY['tent', 'cabin', 'bungalow'])[floor(random()*3)::int + 1],
</td></tr><tr><th id="L215"><a href="#L215">215</a></th><td>
</td></tr><tr><th id="L216"><a href="#L216">216</a></th><td>    (floor(random()*12) + 2)::int,
</td></tr><tr><th id="L217"><a href="#L217">217</a></th><td>    (floor(random()*7) + 1)::int,
</td></tr><tr><th id="L218"><a href="#L218">218</a></th><td>
</td></tr><tr><th id="L219"><a href="#L219">219</a></th><td>    CASE
</td></tr><tr><th id="L220"><a href="#L220">220</a></th><td>        WHEN random() &lt; 0.8  THEN 'active'
</td></tr><tr><th id="L221"><a href="#L221">221</a></th><td>        WHEN random() &lt; 0.95 THEN 'inactive'
</td></tr><tr><th id="L222"><a href="#L222">222</a></th><td>        ELSE 'closed'
</td></tr><tr><th id="L223"><a href="#L223">223</a></th><td>    END,
</td></tr><tr><th id="L224"><a href="#L224">224</a></th><td>
</td></tr><tr><th id="L225"><a href="#L225">225</a></th><td>    (ARRAY['spring','summer','autumn','winter','all'])[floor(random()*5)::int + 1],
</td></tr><tr><th id="L226"><a href="#L226">226</a></th><td>
</td></tr><tr><th id="L227"><a href="#L227">227</a></th><td>    d1,
</td></tr><tr><th id="L228"><a href="#L228">228</a></th><td>    d1 + (floor(random()*30) + 1)::int * INTERVAL '1 day'
</td></tr><tr><th id="L229"><a href="#L229">229</a></th><td>
</td></tr><tr><th id="L230"><a href="#L230">230</a></th><td>FROM (
</td></tr><tr><th id="L231"><a href="#L231">231</a></th><td>    SELECT
</td></tr><tr><th id="L232"><a href="#L232">232</a></th><td>        n,
</td></tr><tr><th id="L233"><a href="#L233">233</a></th><td>        CURRENT_DATE + (floor(random()*365)::int) * INTERVAL '1 day' AS d1
</td></tr><tr><th id="L234"><a href="#L234">234</a></th><td>    FROM generate_series(1, 100000) n
</td></tr><tr><th id="L235"><a href="#L235">235</a></th><td>) data;
</td></tr><tr><th id="L236"><a href="#L236">236</a></th><td>
</td></tr><tr><th id="L237"><a href="#L237">237</a></th><td>
</td></tr><tr><th id="L238"><a href="#L238">238</a></th><td>--7. Activity------------------------------------------------------
</td></tr><tr><th id="L239"><a href="#L239">239</a></th><td>INSERT INTO Activity (
</td></tr><tr><th id="L240"><a href="#L240">240</a></th><td>    location_id,
</td></tr><tr><th id="L241"><a href="#L241">241</a></th><td>    name,
</td></tr><tr><th id="L242"><a href="#L242">242</a></th><td>    description,
</td></tr><tr><th id="L243"><a href="#L243">243</a></th><td>    price_per_person,
</td></tr><tr><th id="L244"><a href="#L244">244</a></th><td>    max_participants,
</td></tr><tr><th id="L245"><a href="#L245">245</a></th><td>    duration_hours,
</td></tr><tr><th id="L246"><a href="#L246">246</a></th><td>    difficulty_level,
</td></tr><tr><th id="L247"><a href="#L247">247</a></th><td>    equipment_provided
</td></tr><tr><th id="L248"><a href="#L248">248</a></th><td>)
</td></tr><tr><th id="L249"><a href="#L249">249</a></th><td>SELECT
</td></tr><tr><th id="L250"><a href="#L250">250</a></th><td>    (gs.n % 100000) AS location_id,
</td></tr><tr><th id="L251"><a href="#L251">251</a></th><td>    CASE r
</td></tr><tr><th id="L252"><a href="#L252">252</a></th><td>        WHEN 0 THEN 'Hiking'
</td></tr><tr><th id="L253"><a href="#L253">253</a></th><td>        WHEN 1 THEN 'Camping'
</td></tr><tr><th id="L254"><a href="#L254">254</a></th><td>        WHEN 2 THEN 'Running Tour'
</td></tr><tr><th id="L255"><a href="#L255">255</a></th><td>        WHEN 3 THEN 'Kayaking'
</td></tr><tr><th id="L256"><a href="#L256">256</a></th><td>        WHEN 4 THEN 'Cycling Tour'
</td></tr><tr><th id="L257"><a href="#L257">257</a></th><td>        WHEN 5 THEN 'Picnic Experience'
</td></tr><tr><th id="L258"><a href="#L258">258</a></th><td>        WHEN 6 THEN 'Rock Climbing'
</td></tr><tr><th id="L259"><a href="#L259">259</a></th><td>        WHEN 7 THEN 'Fishing Trip'
</td></tr><tr><th id="L260"><a href="#L260">260</a></th><td>        WHEN 8 THEN 'Mountain Trekking'
</td></tr><tr><th id="L261"><a href="#L261">261</a></th><td>        WHEN 9 THEN 'Yoga in Nature'
</td></tr><tr><th id="L262"><a href="#L262">262</a></th><td>        WHEN 10 THEN 'Horse Riding'
</td></tr><tr><th id="L263"><a href="#L263">263</a></th><td>        WHEN 11 THEN 'Bird Watching'
</td></tr><tr><th id="L264"><a href="#L264">264</a></th><td>        WHEN 12 THEN 'Paragliding'
</td></tr><tr><th id="L265"><a href="#L265">265</a></th><td>        WHEN 13 THEN 'Ziplining'
</td></tr><tr><th id="L266"><a href="#L266">266</a></th><td>        WHEN 14 THEN 'Rafting'
</td></tr><tr><th id="L267"><a href="#L267">267</a></th><td>        WHEN 15 THEN 'Skiing'
</td></tr><tr><th id="L268"><a href="#L268">268</a></th><td>        WHEN 16 THEN 'Snowboarding'
</td></tr><tr><th id="L269"><a href="#L269">269</a></th><td>        WHEN 17 THEN 'Caving'
</td></tr><tr><th id="L270"><a href="#L270">270</a></th><td>        WHEN 18 THEN 'Safari Tour'
</td></tr><tr><th id="L271"><a href="#L271">271</a></th><td>        WHEN 19 THEN 'Photography Tour'
</td></tr><tr><th id="L272"><a href="#L272">272</a></th><td>        WHEN 20 THEN 'Trail Running'
</td></tr><tr><th id="L273"><a href="#L273">273</a></th><td>        WHEN 21 THEN 'Nature Walk'
</td></tr><tr><th id="L274"><a href="#L274">274</a></th><td>        WHEN 22 THEN 'Meditation Retreat'
</td></tr><tr><th id="L275"><a href="#L275">275</a></th><td>        WHEN 23 THEN 'Swimming Adventure'
</td></tr><tr><th id="L276"><a href="#L276">276</a></th><td>        WHEN 24 THEN 'Cliff Jumping'
</td></tr><tr><th id="L277"><a href="#L277">277</a></th><td>        WHEN 25 THEN 'Archery Practice'
</td></tr><tr><th id="L278"><a href="#L278">278</a></th><td>        WHEN 26 THEN 'Stand Up Paddleboarding'
</td></tr><tr><th id="L279"><a href="#L279">279</a></th><td>        WHEN 27 THEN 'Wildlife Exploration'
</td></tr><tr><th id="L280"><a href="#L280">280</a></th><td>        WHEN 28 THEN 'Forest Survival Training'
</td></tr><tr><th id="L281"><a href="#L281">281</a></th><td>        ELSE 'Sunset Watching Tour'
</td></tr><tr><th id="L282"><a href="#L282">282</a></th><td>    END AS name,
</td></tr><tr><th id="L283"><a href="#L283">283</a></th><td>    CASE r
</td></tr><tr><th id="L284"><a href="#L284">284</a></th><td>        WHEN 0 THEN 'guided hiking in mountains'
</td></tr><tr><th id="L285"><a href="#L285">285</a></th><td>        WHEN 1 THEN 'overnight camping in nature'
</td></tr><tr><th id="L286"><a href="#L286">286</a></th><td>        WHEN 2 THEN 'city running tour experience'
</td></tr><tr><th id="L287"><a href="#L287">287</a></th><td>        WHEN 3 THEN 'river kayaking adventure'
</td></tr><tr><th id="L288"><a href="#L288">288</a></th><td>        WHEN 4 THEN 'cycling through scenic routes'
</td></tr><tr><th id="L289"><a href="#L289">289</a></th><td>        WHEN 5 THEN 'relaxing picnic outdoors'
</td></tr><tr><th id="L290"><a href="#L290">290</a></th><td>        WHEN 6 THEN 'rock climbing training session'
</td></tr><tr><th id="L291"><a href="#L291">291</a></th><td>        WHEN 7 THEN 'fishing at lake or river'
</td></tr><tr><th id="L292"><a href="#L292">292</a></th><td>        WHEN 8 THEN 'high altitude trekking experience'
</td></tr><tr><th id="L293"><a href="#L293">293</a></th><td>        WHEN 9 THEN 'yoga session in nature'
</td></tr><tr><th id="L294"><a href="#L294">294</a></th><td>        WHEN 10 THEN 'horse riding trail adventure'
</td></tr><tr><th id="L295"><a href="#L295">295</a></th><td>        WHEN 11 THEN 'bird watching tour'
</td></tr><tr><th id="L296"><a href="#L296">296</a></th><td>        WHEN 12 THEN 'paragliding flight experience'
</td></tr><tr><th id="L297"><a href="#L297">297</a></th><td>        WHEN 13 THEN 'zipline adventure through forest'
</td></tr><tr><th id="L298"><a href="#L298">298</a></th><td>        WHEN 14 THEN 'white water rafting experience'
</td></tr><tr><th id="L299"><a href="#L299">299</a></th><td>        WHEN 15 THEN 'skiing on mountain slopes'
</td></tr><tr><th id="L300"><a href="#L300">300</a></th><td>        WHEN 16 THEN 'snowboarding adventure'
</td></tr><tr><th id="L301"><a href="#L301">301</a></th><td>        WHEN 17 THEN 'exploring natural caves'
</td></tr><tr><th id="L302"><a href="#L302">302</a></th><td>        WHEN 18 THEN 'safari wildlife tour'
</td></tr><tr><th id="L303"><a href="#L303">303</a></th><td>        WHEN 19 THEN 'guided nature photography tour'
</td></tr><tr><th id="L304"><a href="#L304">304</a></th><td>        WHEN 20 THEN 'long distance trail running'
</td></tr><tr><th id="L305"><a href="#L305">305</a></th><td>        WHEN 21 THEN 'easy nature walking tour'
</td></tr><tr><th id="L306"><a href="#L306">306</a></th><td>        WHEN 22 THEN 'guided meditation retreat outdoors'
</td></tr><tr><th id="L307"><a href="#L307">307</a></th><td>        WHEN 23 THEN 'open water swimming activity'
</td></tr><tr><th id="L308"><a href="#L308">308</a></th><td>        WHEN 24 THEN 'jumping from cliffs into water'
</td></tr><tr><th id="L309"><a href="#L309">309</a></th><td>        WHEN 25 THEN 'archery skill training'
</td></tr><tr><th id="L310"><a href="#L310">310</a></th><td>        WHEN 26 THEN 'paddleboarding on calm waters'
</td></tr><tr><th id="L311"><a href="#L311">311</a></th><td>        WHEN 27 THEN 'wildlife exploration trip'
</td></tr><tr><th id="L312"><a href="#L312">312</a></th><td>        WHEN 28 THEN 'forest survival skill training'
</td></tr><tr><th id="L313"><a href="#L313">313</a></th><td>        ELSE 'sunset viewing experience'
</td></tr><tr><th id="L314"><a href="#L314">314</a></th><td>    END AS description,
</td></tr><tr><th id="L315"><a href="#L315">315</a></th><td>    (10 + floor(random() * 200))::int AS price_per_person,
</td></tr><tr><th id="L316"><a href="#L316">316</a></th><td>    (2 + floor(random() * 20))::int AS max_participants,
</td></tr><tr><th id="L317"><a href="#L317">317</a></th><td>    (1 + floor(random() * 10))::int AS duration_hours,
</td></tr><tr><th id="L318"><a href="#L318">318</a></th><td>    CASE
</td></tr><tr><th id="L319"><a href="#L319">319</a></th><td>        WHEN random() &lt; 0.2 THEN NULL
</td></tr><tr><th id="L320"><a href="#L320">320</a></th><td>        ELSE (1 + floor(random() * 5))::int
</td></tr><tr><th id="L321"><a href="#L321">321</a></th><td>    END AS difficulty_level,
</td></tr><tr><th id="L322"><a href="#L322">322</a></th><td>    CASE
</td></tr><tr><th id="L323"><a href="#L323">323</a></th><td>        WHEN random() &lt; 0.3 THEN 'Provided'
</td></tr><tr><th id="L324"><a href="#L324">324</a></th><td>        WHEN random() &lt; 0.6 THEN 'Basic equipment included'
</td></tr><tr><th id="L325"><a href="#L325">325</a></th><td>        ELSE 'Bring your own equipment'
</td></tr><tr><th id="L326"><a href="#L326">326</a></th><td>    END AS equipment_provided
</td></tr><tr><th id="L327"><a href="#L327">327</a></th><td>FROM (
</td></tr><tr><th id="L328"><a href="#L328">328</a></th><td>    SELECT row_number() OVER () AS n, floor(random() * 30)::int AS r
</td></tr><tr><th id="L329"><a href="#L329">329</a></th><td>    FROM generate_series(1, 250000)
</td></tr><tr><th id="L330"><a href="#L330">330</a></th><td>) gs;
</td></tr><tr><th id="L331"><a href="#L331">331</a></th><td>
</td></tr><tr><th id="L332"><a href="#L332">332</a></th><td>
</td></tr><tr><th id="L333"><a href="#L333">333</a></th><td>--------------------------------------------------------------
</td></tr><tr><th id="L334"><a href="#L334">334</a></th><td>--temp_tables za proverka
</td></tr><tr><th id="L335"><a href="#L335">335</a></th><td>CREATE TEMP TABLE test_user AS SELECT * FROM "User" LIMIT 1000;
</td></tr><tr><th id="L336"><a href="#L336">336</a></th><td>CREATE TEMP TABLE test_guest AS SELECT * FROM Guest LIMIT 1;
</td></tr><tr><th id="L337"><a href="#L337">337</a></th><td>CREATE TEMP TABLE test_host AS SELECT * FROM Host LIMIT 1;
</td></tr><tr><th id="L338"><a href="#L338">338</a></th><td>
</td></tr><tr><th id="L339"><a href="#L339">339</a></th><td>UPDATE test_user SET type = 'guest';
</td></tr><tr><th id="L340"><a href="#L340">340</a></th><td>UPDATE test_user SET type = 'host'
</td></tr><tr><th id="L341"><a href="#L341">341</a></th><td>WHERE user_id IN
</td></tr><tr><th id="L342"><a href="#L342">342</a></th><td>(SELECT user_id
</td></tr><tr><th id="L343"><a href="#L343">343</a></th><td>FROM test_user
</td></tr><tr><th id="L344"><a href="#L344">344</a></th><td>ORDER BY random()
</td></tr><tr><th id="L345"><a href="#L345">345</a></th><td>LIMIT (SELECT COUNT(*) * 0.3
</td></tr><tr><th id="L346"><a href="#L346">346</a></th><td>FROM test_user));
</td></tr><tr><th id="L347"><a href="#L347">347</a></th><td>
</td></tr><tr><th id="L348"><a href="#L348">348</a></th><td>select * from test_user;
</td></tr><tr><th id="L349"><a href="#L349">349</a></th><td>SELECT type, COUNT(*) FROM test_user GROUP BY type;
</td></tr><tr><th id="L350"><a href="#L350">350</a></th><td>
</td></tr><tr><th id="L351"><a href="#L351">351</a></th><td>INSERT INTO test_guest (UseruserId, num_reservations, preference_type)
</td></tr><tr><th id="L352"><a href="#L352">352</a></th><td>SELECT
</td></tr><tr><th id="L353"><a href="#L353">353</a></th><td>    user_id,
</td></tr><tr><th id="L354"><a href="#L354">354</a></th><td>    floor(random() * 30)::int,
</td></tr><tr><th id="L355"><a href="#L355">355</a></th><td>    CASE (floor(random() * 5))::int
</td></tr><tr><th id="L356"><a href="#L356">356</a></th><td>        WHEN 0 THEN 'mountain'
</td></tr><tr><th id="L357"><a href="#L357">357</a></th><td>        WHEN 1 THEN 'forest'
</td></tr><tr><th id="L358"><a href="#L358">358</a></th><td>        WHEN 2 THEN 'lake'
</td></tr><tr><th id="L359"><a href="#L359">359</a></th><td>        WHEN 3 THEN 'beach'
</td></tr><tr><th id="L360"><a href="#L360">360</a></th><td>        ELSE 'luxury'
</td></tr><tr><th id="L361"><a href="#L361">361</a></th><td>    END
</td></tr><tr><th id="L362"><a href="#L362">362</a></th><td>FROM test_user
</td></tr><tr><th id="L363"><a href="#L363">363</a></th><td>WHERE type = 'guest';
</td></tr><tr><th id="L364"><a href="#L364">364</a></th><td>
</td></tr><tr><th id="L365"><a href="#L365">365</a></th><td>INSERT INTO test_host (UseruserId, IBAN, average_score, is_verified)
</td></tr><tr><th id="L366"><a href="#L366">366</a></th><td>SELECT
</td></tr><tr><th id="L367"><a href="#L367">367</a></th><td>    user_id,
</td></tr><tr><th id="L368"><a href="#L368">368</a></th><td>    'MK' || (100000000000000000 + floor(random() * 899999999999999999))::text,
</td></tr><tr><th id="L369"><a href="#L369">369</a></th><td>    (1 + floor(random() * 5))::int,
</td></tr><tr><th id="L370"><a href="#L370">370</a></th><td>    CASE
</td></tr><tr><th id="L371"><a href="#L371">371</a></th><td>        WHEN random() &lt; 0.7 THEN 'yes'
</td></tr><tr><th id="L372"><a href="#L372">372</a></th><td>        ELSE 'no'
</td></tr><tr><th id="L373"><a href="#L373">373</a></th><td>    END
</td></tr><tr><th id="L374"><a href="#L374">374</a></th><td>FROM test_user
</td></tr><tr><th id="L375"><a href="#L375">375</a></th><td>WHERE type = 'host';
</td></tr><tr><th id="L376"><a href="#L376">376</a></th><td>
</td></tr><tr><th id="L377"><a href="#L377">377</a></th><td>SELECT * FROM test_guest LIMIT 5;
</td></tr><tr><th id="L378"><a href="#L378">378</a></th><td>SELECT * FROM test_host LIMIT 5;
</td></tr><tr><th id="L379"><a href="#L379">379</a></th><td>-----------------------------------
</td></tr><tr><th id="L380"><a href="#L380">380</a></th><td>UPDATE "User" SET type = 'guest';
</td></tr><tr><th id="L381"><a href="#L381">381</a></th><td>
</td></tr><tr><th id="L382"><a href="#L382">382</a></th><td>UPDATE "User" SET type = 'host'
</td></tr><tr><th id="L383"><a href="#L383">383</a></th><td>WHERE user_id IN
</td></tr><tr><th id="L384"><a href="#L384">384</a></th><td>(SELECT user_id
</td></tr><tr><th id="L385"><a href="#L385">385</a></th><td>FROM "User"
</td></tr><tr><th id="L386"><a href="#L386">386</a></th><td>ORDER BY random()
</td></tr><tr><th id="L387"><a href="#L387">387</a></th><td>LIMIT (SELECT COUNT(*) * 0.3 FROM "User"));
</td></tr><tr><th id="L388"><a href="#L388">388</a></th><td>
</td></tr><tr><th id="L389"><a href="#L389">389</a></th><td>SELECT type, COUNT(*) FROM "User" GROUP BY type;
</td></tr><tr><th id="L390"><a href="#L390">390</a></th><td>
</td></tr><tr><th id="L391"><a href="#L391">391</a></th><td>--8. Guest----------------------------------------------------
</td></tr><tr><th id="L392"><a href="#L392">392</a></th><td>INSERT INTO Guest (UseruserId, num_reservations, preference_type)
</td></tr><tr><th id="L393"><a href="#L393">393</a></th><td>SELECT
</td></tr><tr><th id="L394"><a href="#L394">394</a></th><td>    user_id,
</td></tr><tr><th id="L395"><a href="#L395">395</a></th><td>    floor(random() * 30)::int,
</td></tr><tr><th id="L396"><a href="#L396">396</a></th><td>    CASE (floor(random() * 5))::int
</td></tr><tr><th id="L397"><a href="#L397">397</a></th><td>        WHEN 0 THEN 'mountain'
</td></tr><tr><th id="L398"><a href="#L398">398</a></th><td>        WHEN 1 THEN 'forest'
</td></tr><tr><th id="L399"><a href="#L399">399</a></th><td>        WHEN 2 THEN 'lake'
</td></tr><tr><th id="L400"><a href="#L400">400</a></th><td>        WHEN 3 THEN 'beach'
</td></tr><tr><th id="L401"><a href="#L401">401</a></th><td>        ELSE 'luxury'
</td></tr><tr><th id="L402"><a href="#L402">402</a></th><td>    END
</td></tr><tr><th id="L403"><a href="#L403">403</a></th><td>FROM "User"
</td></tr><tr><th id="L404"><a href="#L404">404</a></th><td>WHERE type = 'guest';
</td></tr><tr><th id="L405"><a href="#L405">405</a></th><td>
</td></tr><tr><th id="L406"><a href="#L406">406</a></th><td>
</td></tr><tr><th id="L407"><a href="#L407">407</a></th><td>--9. Host-----------------------------------------------------
</td></tr><tr><th id="L408"><a href="#L408">408</a></th><td>INSERT INTO Host (UseruserId, IBAN, average_score, is_verified)
</td></tr><tr><th id="L409"><a href="#L409">409</a></th><td>SELECT
</td></tr><tr><th id="L410"><a href="#L410">410</a></th><td>    user_id,
</td></tr><tr><th id="L411"><a href="#L411">411</a></th><td>    'MK' || to_char(floor(random() * 100000000)::bigint, 'FM00000000') ||
</td></tr><tr><th id="L412"><a href="#L412">412</a></th><td>            to_char(floor(random() * 100000000)::bigint, 'FM00000000'),
</td></tr><tr><th id="L413"><a href="#L413">413</a></th><td>    (1 + floor(random() * 5))::int,
</td></tr><tr><th id="L414"><a href="#L414">414</a></th><td>    CASE
</td></tr><tr><th id="L415"><a href="#L415">415</a></th><td>        WHEN random() &lt; 0.7 THEN 'yes'
</td></tr><tr><th id="L416"><a href="#L416">416</a></th><td>        ELSE 'no'
</td></tr><tr><th id="L417"><a href="#L417">417</a></th><td>    END
</td></tr><tr><th id="L418"><a href="#L418">418</a></th><td>FROM "User"
</td></tr><tr><th id="L419"><a href="#L419">419</a></th><td>WHERE type = 'host';
</td></tr><tr><th id="L420"><a href="#L420">420</a></th><td>
</td></tr><tr><th id="L421"><a href="#L421">421</a></th><td>SELECT COUNT(*) FROM Guest;
</td></tr><tr><th id="L422"><a href="#L422">422</a></th><td>SELECT COUNT(*) FROM Host;
</td></tr><tr><th id="L423"><a href="#L423">423</a></th><td>
</td></tr><tr><th id="L424"><a href="#L424">424</a></th><td>--10. Promotion---------------------------------------------------------------
</td></tr><tr><th id="L425"><a href="#L425">425</a></th><td>DROP TABLE IF EXISTS temp_promo_hosts;
</td></tr><tr><th id="L426"><a href="#L426">426</a></th><td>
</td></tr><tr><th id="L427"><a href="#L427">427</a></th><td>CREATE TEMP TABLE temp_promo_hosts AS
</td></tr><tr><th id="L428"><a href="#L428">428</a></th><td>WITH host_array AS (
</td></tr><tr><th id="L429"><a href="#L429">429</a></th><td>    SELECT array_agg(UseruserId ORDER BY random()) AS hosts
</td></tr><tr><th id="L430"><a href="#L430">430</a></th><td>    FROM Host
</td></tr><tr><th id="L431"><a href="#L431">431</a></th><td>)
</td></tr><tr><th id="L432"><a href="#L432">432</a></th><td>SELECT
</td></tr><tr><th id="L433"><a href="#L433">433</a></th><td>    gs.n,
</td></tr><tr><th id="L434"><a href="#L434">434</a></th><td>    hosts[((gs.n - 1) % array_length(hosts, 1)) + 1] AS UseruserId
</td></tr><tr><th id="L435"><a href="#L435">435</a></th><td>FROM generate_series(1, 300000) gs(n)
</td></tr><tr><th id="L436"><a href="#L436">436</a></th><td>CROSS JOIN host_array;
</td></tr><tr><th id="L437"><a href="#L437">437</a></th><td>
</td></tr><tr><th id="L438"><a href="#L438">438</a></th><td>SELECT COUNT(DISTINCT UseruserId) FROM temp_promo_hosts;
</td></tr><tr><th id="L439"><a href="#L439">439</a></th><td>
</td></tr><tr><th id="L440"><a href="#L440">440</a></th><td>INSERT INTO Promotion (
</td></tr><tr><th id="L441"><a href="#L441">441</a></th><td>    HostUserUserId,
</td></tr><tr><th id="L442"><a href="#L442">442</a></th><td>    promo_code,
</td></tr><tr><th id="L443"><a href="#L443">443</a></th><td>    discount_percent,
</td></tr><tr><th id="L444"><a href="#L444">444</a></th><td>    discount_amount,
</td></tr><tr><th id="L445"><a href="#L445">445</a></th><td>    valid_from,
</td></tr><tr><th id="L446"><a href="#L446">446</a></th><td>    valid_to,
</td></tr><tr><th id="L447"><a href="#L447">447</a></th><td>    description
</td></tr><tr><th id="L448"><a href="#L448">448</a></th><td>)
</td></tr><tr><th id="L449"><a href="#L449">449</a></th><td>WITH base AS (
</td></tr><tr><th id="L450"><a href="#L450">450</a></th><td>    SELECT
</td></tr><tr><th id="L451"><a href="#L451">451</a></th><td>        gs.n,
</td></tr><tr><th id="L452"><a href="#L452">452</a></th><td>        h.UseruserId,
</td></tr><tr><th id="L453"><a href="#L453">453</a></th><td>        random() AS r,
</td></tr><tr><th id="L454"><a href="#L454">454</a></th><td>        CURRENT_DATE - (floor(random() * 365))::int AS d1
</td></tr><tr><th id="L455"><a href="#L455">455</a></th><td>    FROM generate_series(1, 300000) gs(n)
</td></tr><tr><th id="L456"><a href="#L456">456</a></th><td>    JOIN temp_promo_hosts h ON h.n = gs.n
</td></tr><tr><th id="L457"><a href="#L457">457</a></th><td>)
</td></tr><tr><th id="L458"><a href="#L458">458</a></th><td>SELECT
</td></tr><tr><th id="L459"><a href="#L459">459</a></th><td>    UseruserId,
</td></tr><tr><th id="L460"><a href="#L460">460</a></th><td>    'PROMO-' || n,
</td></tr><tr><th id="L461"><a href="#L461">461</a></th><td>    CASE WHEN r &lt; 0.6 THEN (floor(random() * 8) + 1)::int * 10 ELSE 0 END,
</td></tr><tr><th id="L462"><a href="#L462">462</a></th><td>    CASE WHEN r &gt;= 0.6 THEN ((floor(random() * 20) + 1)::int * 100)::numeric ELSE 0 END,
</td></tr><tr><th id="L463"><a href="#L463">463</a></th><td>    d1,
</td></tr><tr><th id="L464"><a href="#L464">464</a></th><td>    d1 + (1 + floor(random() * 30))::int,
</td></tr><tr><th id="L465"><a href="#L465">465</a></th><td>    'Promotion offer ' || n
</td></tr><tr><th id="L466"><a href="#L466">466</a></th><td>FROM base;
</td></tr><tr><th id="L467"><a href="#L467">467</a></th><td>
</td></tr><tr><th id="L468"><a href="#L468">468</a></th><td>
</td></tr><tr><th id="L469"><a href="#L469">469</a></th><td>--11.Host_Host-----------------------------------------
</td></tr><tr><th id="L470"><a href="#L470">470</a></th><td>INSERT INTO Host_Host (CampLocationcampLocationId, HostUseruserid)
</td></tr><tr><th id="L471"><a href="#L471">471</a></th><td>SELECT
</td></tr><tr><th id="L472"><a href="#L472">472</a></th><td>    cl.campLocationId,
</td></tr><tr><th id="L473"><a href="#L473">473</a></th><td>    h.UseruserId
</td></tr><tr><th id="L474"><a href="#L474">474</a></th><td>FROM CampLocation cl
</td></tr><tr><th id="L475"><a href="#L475">475</a></th><td>JOIN LATERAL (
</td></tr><tr><th id="L476"><a href="#L476">476</a></th><td>    SELECT UseruserId
</td></tr><tr><th id="L477"><a href="#L477">477</a></th><td>    FROM Host
</td></tr><tr><th id="L478"><a href="#L478">478</a></th><td>    ORDER BY random()
</td></tr><tr><th id="L479"><a href="#L479">479</a></th><td>    LIMIT (1 + floor(random() * 3))::int
</td></tr><tr><th id="L480"><a href="#L480">480</a></th><td>) h ON true;
</td></tr><tr><th id="L481"><a href="#L481">481</a></th><td>
</td></tr><tr><th id="L482"><a href="#L482">482</a></th><td>--12.camp_location_service-----------------------------------
</td></tr><tr><th id="L483"><a href="#L483">483</a></th><td>INSERT INTO camp_location_service (ServiceserviceId, CampLocationcampLocationId)
</td></tr><tr><th id="L484"><a href="#L484">484</a></th><td>SELECT
</td></tr><tr><th id="L485"><a href="#L485">485</a></th><td>    s.serviceId,
</td></tr><tr><th id="L486"><a href="#L486">486</a></th><td>    cl.campLocationId
</td></tr><tr><th id="L487"><a href="#L487">487</a></th><td>FROM CampLocation cl
</td></tr><tr><th id="L488"><a href="#L488">488</a></th><td>JOIN LATERAL (
</td></tr><tr><th id="L489"><a href="#L489">489</a></th><td>    SELECT serviceId
</td></tr><tr><th id="L490"><a href="#L490">490</a></th><td>    FROM Service
</td></tr><tr><th id="L491"><a href="#L491">491</a></th><td>    ORDER BY random()
</td></tr><tr><th id="L492"><a href="#L492">492</a></th><td>    LIMIT (1 + floor(random() * 5))::int
</td></tr><tr><th id="L493"><a href="#L493">493</a></th><td>) s ON TRUE;
</td></tr><tr><th id="L494"><a href="#L494">494</a></th><td>
</td></tr><tr><th id="L495"><a href="#L495">495</a></th><td>
</td></tr><tr><th id="L496"><a href="#L496">496</a></th><td>--13.Activity_Activity-----------------------------------------
</td></tr><tr><th id="L497"><a href="#L497">497</a></th><td>INSERT INTO Activity_Activity (
</td></tr><tr><th id="L498"><a href="#L498">498</a></th><td>    Activityactivity_id2,
</td></tr><tr><th id="L499"><a href="#L499">499</a></th><td>    CampLocationcampLocationId
</td></tr><tr><th id="L500"><a href="#L500">500</a></th><td>)
</td></tr><tr><th id="L501"><a href="#L501">501</a></th><td>SELECT
</td></tr><tr><th id="L502"><a href="#L502">502</a></th><td>    act.activity_id,
</td></tr><tr><th id="L503"><a href="#L503">503</a></th><td>    cl.campLocationId
</td></tr><tr><th id="L504"><a href="#L504">504</a></th><td>FROM CampLocation cl
</td></tr><tr><th id="L505"><a href="#L505">505</a></th><td>JOIN LATERAL (
</td></tr><tr><th id="L506"><a href="#L506">506</a></th><td>    SELECT activity_id
</td></tr><tr><th id="L507"><a href="#L507">507</a></th><td>    FROM Activity
</td></tr><tr><th id="L508"><a href="#L508">508</a></th><td>    ORDER BY random()
</td></tr><tr><th id="L509"><a href="#L509">509</a></th><td>    LIMIT (2 + floor(random() * 5))::int
</td></tr><tr><th id="L510"><a href="#L510">510</a></th><td>) act ON TRUE;
</td></tr><tr><th id="L511"><a href="#L511">511</a></th><td>
</td></tr><tr><th id="L512"><a href="#L512">512</a></th><td>--14.Availability_CampLocation_has-------------------------------
</td></tr><tr><th id="L513"><a href="#L513">513</a></th><td>INSERT INTO Availability_CampLocation_has (
</td></tr><tr><th id="L514"><a href="#L514">514</a></th><td>    AvailabilityavailabilityId,
</td></tr><tr><th id="L515"><a href="#L515">515</a></th><td>    CampLocationcampLocationId
</td></tr><tr><th id="L516"><a href="#L516">516</a></th><td>)
</td></tr><tr><th id="L517"><a href="#L517">517</a></th><td>WITH avail_array AS (
</td></tr><tr><th id="L518"><a href="#L518">518</a></th><td>    SELECT array_agg(availabilityId) AS ids
</td></tr><tr><th id="L519"><a href="#L519">519</a></th><td>    FROM Availability
</td></tr><tr><th id="L520"><a href="#L520">520</a></th><td>)
</td></tr><tr><th id="L521"><a href="#L521">521</a></th><td>SELECT
</td></tr><tr><th id="L522"><a href="#L522">522</a></th><td>    ids[1 + floor(random() * array_length(ids, 1))::int] AS availabilityId,
</td></tr><tr><th id="L523"><a href="#L523">523</a></th><td>    cl.campLocationId
</td></tr><tr><th id="L524"><a href="#L524">524</a></th><td>FROM CampLocation cl
</td></tr><tr><th id="L525"><a href="#L525">525</a></th><td>CROSS JOIN avail_array;
</td></tr><tr><th id="L526"><a href="#L526">526</a></th><td>
</td></tr><tr><th id="L527"><a href="#L527">527</a></th><td>
</td></tr><tr><th id="L528"><a href="#L528">528</a></th><td>--15.Favorites----------------------------------------
</td></tr><tr><th id="L529"><a href="#L529">529</a></th><td>INSERT INTO Favorites (locationId, date_added)
</td></tr><tr><th id="L530"><a href="#L530">530</a></th><td>WITH cl_array AS (
</td></tr><tr><th id="L531"><a href="#L531">531</a></th><td>    SELECT array_agg(campLocationId) AS ids
</td></tr><tr><th id="L532"><a href="#L532">532</a></th><td>    FROM CampLocation
</td></tr><tr><th id="L533"><a href="#L533">533</a></th><td>)
</td></tr><tr><th id="L534"><a href="#L534">534</a></th><td>SELECT
</td></tr><tr><th id="L535"><a href="#L535">535</a></th><td>    ids[1 + floor(random() * array_length(ids, 1))::int],
</td></tr><tr><th id="L536"><a href="#L536">536</a></th><td>    CURRENT_DATE - (floor(random() * 365))::int
</td></tr><tr><th id="L537"><a href="#L537">537</a></th><td>FROM generate_series(1, 300000)
</td></tr><tr><th id="L538"><a href="#L538">538</a></th><td>CROSS JOIN cl_array;
</td></tr><tr><th id="L539"><a href="#L539">539</a></th><td>
</td></tr><tr><th id="L540"><a href="#L540">540</a></th><td>
</td></tr><tr><th id="L541"><a href="#L541">541</a></th><td>--16.Favorites_Guest_saves-----------------------------
</td></tr><tr><th id="L542"><a href="#L542">542</a></th><td>INSERT INTO Favorites_Guest_saves (FavoritesfavoriteId, GuestUseruserId)
</td></tr><tr><th id="L543"><a href="#L543">543</a></th><td>SELECT
</td></tr><tr><th id="L544"><a href="#L544">544</a></th><td>    f.favorite_id,
</td></tr><tr><th id="L545"><a href="#L545">545</a></th><td>    g.UseruserId
</td></tr><tr><th id="L546"><a href="#L546">546</a></th><td>FROM Favorites f
</td></tr><tr><th id="L547"><a href="#L547">547</a></th><td>JOIN LATERAL (
</td></tr><tr><th id="L548"><a href="#L548">548</a></th><td>    SELECT  UseruserId
</td></tr><tr><th id="L549"><a href="#L549">549</a></th><td>    FROM Guest
</td></tr><tr><th id="L550"><a href="#L550">550</a></th><td>    ORDER BY random()
</td></tr><tr><th id="L551"><a href="#L551">551</a></th><td>    LIMIT (1 + floor(random() * 3))::int
</td></tr><tr><th id="L552"><a href="#L552">552</a></th><td>) g ON true;
</td></tr><tr><th id="L553"><a href="#L553">553</a></th><td>
</td></tr><tr><th id="L554"><a href="#L554">554</a></th><td>--17.EmergancyContact---------------------------
</td></tr><tr><th id="L555"><a href="#L555">555</a></th><td>INSERT INTO EmergencyContact (
</td></tr><tr><th id="L556"><a href="#L556">556</a></th><td>    CampLocationcampLocationId,
</td></tr><tr><th id="L557"><a href="#L557">557</a></th><td>    contact_name,
</td></tr><tr><th id="L558"><a href="#L558">558</a></th><td>    phone_number,
</td></tr><tr><th id="L559"><a href="#L559">559</a></th><td>    created_at
</td></tr><tr><th id="L560"><a href="#L560">560</a></th><td>)
</td></tr><tr><th id="L561"><a href="#L561">561</a></th><td>WITH cl_array AS (
</td></tr><tr><th id="L562"><a href="#L562">562</a></th><td>    SELECT array_agg(campLocationId) AS ids,
</td></tr><tr><th id="L563"><a href="#L563">563</a></th><td>           array_agg(name) AS names
</td></tr><tr><th id="L564"><a href="#L564">564</a></th><td>    FROM CampLocation
</td></tr><tr><th id="L565"><a href="#L565">565</a></th><td>)
</td></tr><tr><th id="L566"><a href="#L566">566</a></th><td>SELECT
</td></tr><tr><th id="L567"><a href="#L567">567</a></th><td>    ids[1 + floor(random() * array_length(ids, 1))::int],
</td></tr><tr><th id="L568"><a href="#L568">568</a></th><td>    'Emergency Contact ' || gs.n,
</td></tr><tr><th id="L569"><a href="#L569">569</a></th><td>    '+3897' || lpad((floor(random() * 10000000))::text, 7, '0'),
</td></tr><tr><th id="L570"><a href="#L570">570</a></th><td>    CURRENT_DATE - (floor(random() * 365))::int
</td></tr><tr><th id="L571"><a href="#L571">571</a></th><td>FROM generate_series(1, 100000) gs(n)
</td></tr><tr><th id="L572"><a href="#L572">572</a></th><td>CROSS JOIN cl_array;
</td></tr><tr><th id="L573"><a href="#L573">573</a></th><td>select * from emergencycontact;
</td></tr><tr><th id="L574"><a href="#L574">574</a></th><td>
</td></tr><tr><th id="L575"><a href="#L575">575</a></th><td>
</td></tr><tr><th id="L576"><a href="#L576">576</a></th><td>--18.PriceHistory----------------------------------
</td></tr><tr><th id="L577"><a href="#L577">577</a></th><td>INSERT INTO PriceHistory (
</td></tr><tr><th id="L578"><a href="#L578">578</a></th><td>    CampLocationcampLocationId,
</td></tr><tr><th id="L579"><a href="#L579">579</a></th><td>    price_per_night,
</td></tr><tr><th id="L580"><a href="#L580">580</a></th><td>    date_from,
</td></tr><tr><th id="L581"><a href="#L581">581</a></th><td>    date_to
</td></tr><tr><th id="L582"><a href="#L582">582</a></th><td>)
</td></tr><tr><th id="L583"><a href="#L583">583</a></th><td>WITH cl_array AS (
</td></tr><tr><th id="L584"><a href="#L584">584</a></th><td>    SELECT array_agg(campLocationId) AS ids
</td></tr><tr><th id="L585"><a href="#L585">585</a></th><td>    FROM CampLocation
</td></tr><tr><th id="L586"><a href="#L586">586</a></th><td>),
</td></tr><tr><th id="L587"><a href="#L587">587</a></th><td>base AS (
</td></tr><tr><th id="L588"><a href="#L588">588</a></th><td>    SELECT
</td></tr><tr><th id="L589"><a href="#L589">589</a></th><td>        ids[1 + floor(random() * array_length(ids, 1))::int] AS campLocationId,
</td></tr><tr><th id="L590"><a href="#L590">590</a></th><td>        (floor(random() * 30) + 1)::int * 10 AS price,
</td></tr><tr><th id="L591"><a href="#L591">591</a></th><td>        DATE '2020-01-01' + (floor(random() * 1500))::int AS date_from
</td></tr><tr><th id="L592"><a href="#L592">592</a></th><td>    FROM generate_series(1, 5000000) gs
</td></tr><tr><th id="L593"><a href="#L593">593</a></th><td>    CROSS JOIN cl_array
</td></tr><tr><th id="L594"><a href="#L594">594</a></th><td>)
</td></tr><tr><th id="L595"><a href="#L595">595</a></th><td>SELECT
</td></tr><tr><th id="L596"><a href="#L596">596</a></th><td>    campLocationId,
</td></tr><tr><th id="L597"><a href="#L597">597</a></th><td>    price,
</td></tr><tr><th id="L598"><a href="#L598">598</a></th><td>    date_from,
</td></tr><tr><th id="L599"><a href="#L599">599</a></th><td>    date_from + (1 + floor(random() * 30))::int
</td></tr><tr><th id="L600"><a href="#L600">600</a></th><td>FROM base;
</td></tr><tr><th id="L601"><a href="#L601">601</a></th><td>
</td></tr><tr><th id="L602"><a href="#L602">602</a></th><td>
</td></tr><tr><th id="L603"><a href="#L603">603</a></th><td>--19.Equipment -------------------------------------
</td></tr><tr><th id="L604"><a href="#L604">604</a></th><td>TRUNCATE TABLE equipment RESTART IDENTITY CASCADE;
</td></tr><tr><th id="L605"><a href="#L605">605</a></th><td>INSERT INTO Equipment (
</td></tr><tr><th id="L606"><a href="#L606">606</a></th><td>    EquipmentTypeEquipmentTypeId,
</td></tr><tr><th id="L607"><a href="#L607">607</a></th><td>    CampLocationcampLocationId,
</td></tr><tr><th id="L608"><a href="#L608">608</a></th><td>    name,
</td></tr><tr><th id="L609"><a href="#L609">609</a></th><td>    description,
</td></tr><tr><th id="L610"><a href="#L610">610</a></th><td>    total_quantity,
</td></tr><tr><th id="L611"><a href="#L611">611</a></th><td>    available_quantity,
</td></tr><tr><th id="L612"><a href="#L612">612</a></th><td>    rental_price_per_day,
</td></tr><tr><th id="L613"><a href="#L613">613</a></th><td>    deposit_amount,
</td></tr><tr><th id="L614"><a href="#L614">614</a></th><td>    condition_status,
</td></tr><tr><th id="L615"><a href="#L615">615</a></th><td>    is_available
</td></tr><tr><th id="L616"><a href="#L616">616</a></th><td>)
</td></tr><tr><th id="L617"><a href="#L617">617</a></th><td>WITH et_array AS (
</td></tr><tr><th id="L618"><a href="#L618">618</a></th><td>    SELECT array_agg(EquipmentTypeId) AS et_ids,
</td></tr><tr><th id="L619"><a href="#L619">619</a></th><td>           array_agg(type_name) AS et_names,
</td></tr><tr><th id="L620"><a href="#L620">620</a></th><td>           array_agg(description) AS et_descs
</td></tr><tr><th id="L621"><a href="#L621">621</a></th><td>    FROM EquipmentType
</td></tr><tr><th id="L622"><a href="#L622">622</a></th><td>),
</td></tr><tr><th id="L623"><a href="#L623">623</a></th><td>cl_array AS (
</td></tr><tr><th id="L624"><a href="#L624">624</a></th><td>    SELECT array_agg(campLocationId) AS cl_ids
</td></tr><tr><th id="L625"><a href="#L625">625</a></th><td>    FROM CampLocation
</td></tr><tr><th id="L626"><a href="#L626">626</a></th><td>),
</td></tr><tr><th id="L627"><a href="#L627">627</a></th><td>base AS (
</td></tr><tr><th id="L628"><a href="#L628">628</a></th><td>    SELECT
</td></tr><tr><th id="L629"><a href="#L629">629</a></th><td>        gs.n,
</td></tr><tr><th id="L630"><a href="#L630">630</a></th><td>        et_ids[1 + floor(random() * array_length(et_ids, 1))::int] AS et_id,
</td></tr><tr><th id="L631"><a href="#L631">631</a></th><td>        et_names[1 + floor(random() * array_length(et_names, 1))::int] AS et_name,
</td></tr><tr><th id="L632"><a href="#L632">632</a></th><td>        et_descs[1 + floor(random() * array_length(et_descs, 1))::int] AS et_desc,
</td></tr><tr><th id="L633"><a href="#L633">633</a></th><td>        cl_ids[1 + floor(random() * array_length(cl_ids, 1))::int] AS cl_id,
</td></tr><tr><th id="L634"><a href="#L634">634</a></th><td>        (floor(random()*20 + 1))::int AS total_qty,
</td></tr><tr><th id="L635"><a href="#L635">635</a></th><td>        (floor(random() * (floor(random()*20 + 1))))::int AS avail_qty
</td></tr><tr><th id="L636"><a href="#L636">636</a></th><td>    FROM generate_series(1, 1000000) gs(n)
</td></tr><tr><th id="L637"><a href="#L637">637</a></th><td>    CROSS JOIN et_array
</td></tr><tr><th id="L638"><a href="#L638">638</a></th><td>    CROSS JOIN cl_array
</td></tr><tr><th id="L639"><a href="#L639">639</a></th><td>)
</td></tr><tr><th id="L640"><a href="#L640">640</a></th><td>SELECT
</td></tr><tr><th id="L641"><a href="#L641">641</a></th><td>    et_id,
</td></tr><tr><th id="L642"><a href="#L642">642</a></th><td>    cl_id,
</td></tr><tr><th id="L643"><a href="#L643">643</a></th><td>    CASE et_name
</td></tr><tr><th id="L644"><a href="#L644">644</a></th><td>        WHEN 'Shelter Equipment' THEN (ARRAY['4-Person Tent','Ultralight Tent','Tarp Shelter','Tent Poles Set','Groundsheet'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L645"><a href="#L645">645</a></th><td>        WHEN 'Sleeping Equipment' THEN (ARRAY['Sleeping Bag - Winter','Sleeping Bag - Summer','Inflatable Mattress','Camping Pillow','Thermal Blanket'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L646"><a href="#L646">646</a></th><td>        WHEN 'Cooking Equipment' THEN (ARRAY['Portable Gas Stove','Camping Grill','Cooking Pot Set','Frying Pan Outdoor','Camping Kettle'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L647"><a href="#L647">647</a></th><td>        WHEN 'Lighting Equipment' THEN (ARRAY['LED Camping Lantern','Headlamp','Solar Lamp','Flashlight Pro','String Camping Lights'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L648"><a href="#L648">648</a></th><td>        WHEN 'Furniture' THEN (ARRAY['Camping Chair','Folding Table','Camping Stool','Portable Bench','Relax Chair Lounger'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L649"><a href="#L649">649</a></th><td>        WHEN 'Safety Equipment' THEN (ARRAY['First Aid Kit','Emergency Whistle','Survival Kit','Fire Extinguisher','Safety Helmet'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L650"><a href="#L650">650</a></th><td>        WHEN 'Adventure Equipment' THEN (ARRAY['Hiking Backpack','Climbing Harness','Rope Set','Adventure Helmet','Trail Gloves'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L651"><a href="#L651">651</a></th><td>        WHEN 'Water Equipment' THEN (ARRAY['Water Filter','Water Tank','Hydration Pack','Water Purification Tablets','Portable Shower'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L652"><a href="#L652">652</a></th><td>        WHEN 'Climbing Equipment' THEN (ARRAY['Climbing Rope','Carabiner Set','Climbing Shoes','Belay Device','Climbing Harness Pro'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L653"><a href="#L653">653</a></th><td>        WHEN 'Fishing Equipment' THEN (ARRAY['Fishing Rod','Fishing Net','Tackle Box','Fishing Reel','Bait Kit'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L654"><a href="#L654">654</a></th><td>        WHEN 'Winter Equipment' THEN (ARRAY['Snow Boots','Winter Sleeping Bag','Thermal Jacket','Hand Warmers','Ice Axe'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L655"><a href="#L655">655</a></th><td>        WHEN 'Navigation Equipment' THEN (ARRAY['GPS Device','Compass Pro','Topographic Map Kit','Altimeter','Navigation Watch'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L656"><a href="#L656">656</a></th><td>        WHEN 'Hygiene Equipment' THEN (ARRAY['Camping Shower','Portable Toilet','Soap Kit','Wet Wipes Pack','Toothbrush Kit'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L657"><a href="#L657">657</a></th><td>        WHEN 'Entertainment Equipment' THEN (ARRAY['Portable Speaker','Camping Cards','Board Game Set','Hammock','Projector Mini'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L658"><a href="#L658">658</a></th><td>        WHEN 'Power Equipment' THEN (ARRAY['Solar Panel','Portable Generator','Power Bank','Battery Pack','Inverter'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L659"><a href="#L659">659</a></th><td>        WHEN 'Repair Equipment' THEN (ARRAY['Multi-tool Kit','Repair Tape','Toolbox Set','Hammer Outdoor','Screwdriver Kit'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L660"><a href="#L660">660</a></th><td>        WHEN 'Storage Equipment' THEN (ARRAY['Dry Bag','Storage Box','Backpack Organizer','Waterproof Container','Compression Sack'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L661"><a href="#L661">661</a></th><td>        WHEN 'Medical Equipment' THEN (ARRAY['First Aid Advanced Kit','Bandage Set','Pain Relief Kit','Emergency Medical Kit','Thermometer Kit'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L662"><a href="#L662">662</a></th><td>        WHEN 'Fire Equipment' THEN (ARRAY['Fire Starter Kit','Magnesium Rod','Waterproof Matches','Fire Steel','Emergency Torch'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L663"><a href="#L663">663</a></th><td>        WHEN 'Hiking Equipment' THEN (ARRAY['Trekking Poles','Hiking Backpack','Trail Shoes','Rain Jacket','Hiking Map Kit'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L664"><a href="#L664">664</a></th><td>        WHEN 'Cycling Equipment' THEN (ARRAY['Mountain Bike Helmet','Bike Repair Kit','Cycling Gloves','Bike Pump','Reflective Vest'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L665"><a href="#L665">665</a></th><td>        WHEN 'Skiing Equipment' THEN (ARRAY['Ski Poles','Ski Helmet','Ski Goggles','Ski Boots','Ski Jacket'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L666"><a href="#L666">666</a></th><td>        WHEN 'Cooking Accessories' THEN (ARRAY['Camping Spoon Set','Portable Knife Set','Cutting Board','Spice Kit','Cooking Utensil Set'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L667"><a href="#L667">667</a></th><td>        WHEN 'Camping Tools' THEN (ARRAY['Hammer','Tent Peg Extractor','Camping Axe','Saw Folding','Multi-purpose Tool'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L668"><a href="#L668">668</a></th><td>        WHEN 'Electronics Equipment' THEN (ARRAY['Camping Radio','Portable Charger','Walkie Talkie','LED Charger Lamp','Smartwatch Outdoor'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L669"><a href="#L669">669</a></th><td>        WHEN 'Kids Equipment' THEN (ARRAY['Kids Sleeping Bag','Mini Backpack','Kids Chair','Outdoor Toy Set','Kids Lantern'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L670"><a href="#L670">670</a></th><td>        WHEN 'Pet Equipment' THEN (ARRAY['Dog Leash Set','Pet Tent','Pet Food Container','Portable Water Bowl','Pet Harness'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L671"><a href="#L671">671</a></th><td>        WHEN 'Emergency Equipment' THEN (ARRAY['Emergency Shelter','Survival Blanket','Rescue Whistle','Signal Mirror','Emergency Kit Pro'])[floor(random()*5 + 1)::int]
</td></tr><tr><th id="L672"><a href="#L672">672</a></th><td>        ELSE 'Generic Equipment'
</td></tr><tr><th id="L673"><a href="#L673">673</a></th><td>    END,
</td></tr><tr><th id="L674"><a href="#L674">674</a></th><td>    et_desc,
</td></tr><tr><th id="L675"><a href="#L675">675</a></th><td>    total_qty,
</td></tr><tr><th id="L676"><a href="#L676">676</a></th><td>    CASE WHEN avail_qty &gt; total_qty THEN total_qty ELSE avail_qty END,
</td></tr><tr><th id="L677"><a href="#L677">677</a></th><td>    (floor(random() * 16) + 1)::int * 5,
</td></tr><tr><th id="L678"><a href="#L678">678</a></th><td>    (floor(random() * 25))::int * 10,
</td></tr><tr><th id="L679"><a href="#L679">679</a></th><td>    (ARRAY['new','good','fair','poor','under_repair'])[floor(random()*5 + 1)::int],
</td></tr><tr><th id="L680"><a href="#L680">680</a></th><td>    CASE WHEN avail_qty = 0 THEN 'no' ELSE CASE WHEN random() &lt; 0.75 THEN 'yes' ELSE 'no' END END
</td></tr><tr><th id="L681"><a href="#L681">681</a></th><td>FROM base;
</td></tr><tr><th id="L682"><a href="#L682">682</a></th><td>select * from equipment;
</td></tr><tr><th id="L683"><a href="#L683">683</a></th><td>
</td></tr><tr><th id="L684"><a href="#L684">684</a></th><td>
</td></tr><tr><th id="L685"><a href="#L685">685</a></th><td>
</td></tr><tr><th id="L686"><a href="#L686">686</a></th><td>--20. Reservation --------------------------------------------
</td></tr><tr><th id="L687"><a href="#L687">687</a></th><td>DROP TABLE IF EXISTS temp_reservation_data;
</td></tr><tr><th id="L688"><a href="#L688">688</a></th><td>
</td></tr><tr><th id="L689"><a href="#L689">689</a></th><td>CREATE TEMP TABLE temp_reservation_data AS
</td></tr><tr><th id="L690"><a href="#L690">690</a></th><td>WITH guest_array AS (
</td></tr><tr><th id="L691"><a href="#L691">691</a></th><td>    SELECT array_agg(user_id ORDER BY random()) AS guests
</td></tr><tr><th id="L692"><a href="#L692">692</a></th><td>    FROM "User"
</td></tr><tr><th id="L693"><a href="#L693">693</a></th><td>    WHERE type = 'guest'
</td></tr><tr><th id="L694"><a href="#L694">694</a></th><td>),
</td></tr><tr><th id="L695"><a href="#L695">695</a></th><td>promo_array AS (
</td></tr><tr><th id="L696"><a href="#L696">696</a></th><td>    SELECT array_agg(promotionId ORDER BY random()) AS promos
</td></tr><tr><th id="L697"><a href="#L697">697</a></th><td>    FROM Promotion
</td></tr><tr><th id="L698"><a href="#L698">698</a></th><td>),
</td></tr><tr><th id="L699"><a href="#L699">699</a></th><td>camp_array AS (
</td></tr><tr><th id="L700"><a href="#L700">700</a></th><td>    SELECT array_agg(campLocationId ORDER BY random()) AS camps
</td></tr><tr><th id="L701"><a href="#L701">701</a></th><td>    FROM CampLocation
</td></tr><tr><th id="L702"><a href="#L702">702</a></th><td>)
</td></tr><tr><th id="L703"><a href="#L703">703</a></th><td>SELECT
</td></tr><tr><th id="L704"><a href="#L704">704</a></th><td>    gs.n,
</td></tr><tr><th id="L705"><a href="#L705">705</a></th><td>    ga.guests[((gs.n - 1) % array_length(ga.guests, 1)) + 1] AS guest_id,
</td></tr><tr><th id="L706"><a href="#L706">706</a></th><td>    pa.promos[((gs.n - 1) % array_length(pa.promos, 1)) + 1] AS promo_id,
</td></tr><tr><th id="L707"><a href="#L707">707</a></th><td>    ca.camps[((gs.n - 1) % array_length(ca.camps, 1)) + 1] AS camp_id,
</td></tr><tr><th id="L708"><a href="#L708">708</a></th><td>    CURRENT_DATE - ((gs.n % 730) + 1) AS created_at
</td></tr><tr><th id="L709"><a href="#L709">709</a></th><td>FROM generate_series(1, 5000000) gs(n)
</td></tr><tr><th id="L710"><a href="#L710">710</a></th><td>CROSS JOIN guest_array ga
</td></tr><tr><th id="L711"><a href="#L711">711</a></th><td>CROSS JOIN promo_array pa
</td></tr><tr><th id="L712"><a href="#L712">712</a></th><td>CROSS JOIN camp_array ca;
</td></tr><tr><th id="L713"><a href="#L713">713</a></th><td>
</td></tr><tr><th id="L714"><a href="#L714">714</a></th><td>INSERT INTO Reservation (
</td></tr><tr><th id="L715"><a href="#L715">715</a></th><td>    GuestUseruserId,
</td></tr><tr><th id="L716"><a href="#L716">716</a></th><td>    PromotionpromotionId,
</td></tr><tr><th id="L717"><a href="#L717">717</a></th><td>    CampLocationcamplocationId,
</td></tr><tr><th id="L718"><a href="#L718">718</a></th><td>    number_of_guests,
</td></tr><tr><th id="L719"><a href="#L719">719</a></th><td>    reservation_status,
</td></tr><tr><th id="L720"><a href="#L720">720</a></th><td>    check_in_date,
</td></tr><tr><th id="L721"><a href="#L721">721</a></th><td>    check_out_date,
</td></tr><tr><th id="L722"><a href="#L722">722</a></th><td>    created_at,
</td></tr><tr><th id="L723"><a href="#L723">723</a></th><td>    total_price
</td></tr><tr><th id="L724"><a href="#L724">724</a></th><td>)
</td></tr><tr><th id="L725"><a href="#L725">725</a></th><td>WITH numbered AS (
</td></tr><tr><th id="L726"><a href="#L726">726</a></th><td>    SELECT
</td></tr><tr><th id="L727"><a href="#L727">727</a></th><td>        trd.*,
</td></tr><tr><th id="L728"><a href="#L728">728</a></th><td>        ROW_NUMBER() OVER (PARTITION BY camp_id ORDER BY n) AS rn
</td></tr><tr><th id="L729"><a href="#L729">729</a></th><td>    FROM temp_reservation_data trd
</td></tr><tr><th id="L730"><a href="#L730">730</a></th><td>),
</td></tr><tr><th id="L731"><a href="#L731">731</a></th><td>dates AS (
</td></tr><tr><th id="L732"><a href="#L732">732</a></th><td>    SELECT
</td></tr><tr><th id="L733"><a href="#L733">733</a></th><td>        n.*,
</td></tr><tr><th id="L734"><a href="#L734">734</a></th><td>        cl.opening_date,
</td></tr><tr><th id="L735"><a href="#L735">735</a></th><td>        cl.opening_date + (rn * 5) * INTERVAL '1 day' AS check_in_ts,
</td></tr><tr><th id="L736"><a href="#L736">736</a></th><td>        cl.opening_date
</td></tr><tr><th id="L737"><a href="#L737">737</a></th><td>        + (rn * 5) * INTERVAL '1 day'
</td></tr><tr><th id="L738"><a href="#L738">738</a></th><td>        + (2 + (rn % 3)) * INTERVAL '1 day' AS check_out_ts,
</td></tr><tr><th id="L739"><a href="#L739">739</a></th><td>        cl.closing_date
</td></tr><tr><th id="L740"><a href="#L740">740</a></th><td>    FROM numbered n
</td></tr><tr><th id="L741"><a href="#L741">741</a></th><td>    JOIN CampLocation cl ON cl.campLocationId = n.camp_id
</td></tr><tr><th id="L742"><a href="#L742">742</a></th><td>)
</td></tr><tr><th id="L743"><a href="#L743">743</a></th><td>SELECT
</td></tr><tr><th id="L744"><a href="#L744">744</a></th><td>    d.guest_id,
</td></tr><tr><th id="L745"><a href="#L745">745</a></th><td>    CASE WHEN d.n % 3 = 0 THEN d.promo_id ELSE NULL END,
</td></tr><tr><th id="L746"><a href="#L746">746</a></th><td>    d.camp_id,
</td></tr><tr><th id="L747"><a href="#L747">747</a></th><td>    (1 + (d.n % 5))::int,
</td></tr><tr><th id="L748"><a href="#L748">748</a></th><td>    CASE
</td></tr><tr><th id="L749"><a href="#L749">749</a></th><td>        WHEN d.check_in_ts::date &gt; CURRENT_DATE THEN
</td></tr><tr><th id="L750"><a href="#L750">750</a></th><td>            (ARRAY['pending','confirmed'])[(d.n % 2) + 1]
</td></tr><tr><th id="L751"><a href="#L751">751</a></th><td>        ELSE
</td></tr><tr><th id="L752"><a href="#L752">752</a></th><td>            (ARRAY['pending','confirmed','cancelled','completed'])[(d.n % 4) + 1]
</td></tr><tr><th id="L753"><a href="#L753">753</a></th><td>    END,
</td></tr><tr><th id="L754"><a href="#L754">754</a></th><td>    d.check_in_ts::date,
</td></tr><tr><th id="L755"><a href="#L755">755</a></th><td>    d.check_out_ts::date,
</td></tr><tr><th id="L756"><a href="#L756">756</a></th><td>    LEAST(d.created_at, d.check_in_ts::date - 1),
</td></tr><tr><th id="L757"><a href="#L757">757</a></th><td>    (50 + (d.n % 500))::numeric(12,2)
</td></tr><tr><th id="L758"><a href="#L758">758</a></th><td>FROM dates d
</td></tr><tr><th id="L759"><a href="#L759">759</a></th><td>WHERE d.check_out_ts &lt;= d.closing_date;
</td></tr><tr><th id="L760"><a href="#L760">760</a></th><td>
</td></tr><tr><th id="L761"><a href="#L761">761</a></th><td>UPDATE Reservation
</td></tr><tr><th id="L762"><a href="#L762">762</a></th><td>SET reservation_status = 'cancelled'
</td></tr><tr><th id="L763"><a href="#L763">763</a></th><td>WHERE reservationId % 7 = 0;
</td></tr><tr><th id="L764"><a href="#L764">764</a></th><td>
</td></tr><tr><th id="L765"><a href="#L765">765</a></th><td>--21. Payment ---------------------------------------
</td></tr><tr><th id="L766"><a href="#L766">766</a></th><td>INSERT INTO Payment (
</td></tr><tr><th id="L767"><a href="#L767">767</a></th><td>    ReservationreservationId,
</td></tr><tr><th id="L768"><a href="#L768">768</a></th><td>    amount,
</td></tr><tr><th id="L769"><a href="#L769">769</a></th><td>    payment_method,
</td></tr><tr><th id="L770"><a href="#L770">770</a></th><td>    payment_date,
</td></tr><tr><th id="L771"><a href="#L771">771</a></th><td>    transaction_reference,
</td></tr><tr><th id="L772"><a href="#L772">772</a></th><td>    payment_status
</td></tr><tr><th id="L773"><a href="#L773">773</a></th><td>)
</td></tr><tr><th id="L774"><a href="#L774">774</a></th><td>WITH res_array AS (
</td></tr><tr><th id="L775"><a href="#L775">775</a></th><td>    SELECT
</td></tr><tr><th id="L776"><a href="#L776">776</a></th><td>        array_agg(reservationId ORDER BY random()) AS ids,
</td></tr><tr><th id="L777"><a href="#L777">777</a></th><td>        array_agg(check_in_date ORDER BY random()) AS dates,
</td></tr><tr><th id="L778"><a href="#L778">778</a></th><td>        array_length(array_agg(reservationId), 1) AS cnt
</td></tr><tr><th id="L779"><a href="#L779">779</a></th><td>    FROM Reservation
</td></tr><tr><th id="L780"><a href="#L780">780</a></th><td>)
</td></tr><tr><th id="L781"><a href="#L781">781</a></th><td>SELECT
</td></tr><tr><th id="L782"><a href="#L782">782</a></th><td>    ids[1 + (gs.i % cnt)],
</td></tr><tr><th id="L783"><a href="#L783">783</a></th><td>    (50 + (abs(hashint4(gs.i * 7)) % 450))::numeric(12,2),
</td></tr><tr><th id="L784"><a href="#L784">784</a></th><td>    (ARRAY['online', 'cash'])[(abs(hashint4(gs.i * 3)) % 2) + 1],
</td></tr><tr><th id="L785"><a href="#L785">785</a></th><td>    LEAST(
</td></tr><tr><th id="L786"><a href="#L786">786</a></th><td>        CURRENT_DATE,
</td></tr><tr><th id="L787"><a href="#L787">787</a></th><td>        CURRENT_DATE - (abs(hashint4(gs.i * 11)) % 365)
</td></tr><tr><th id="L788"><a href="#L788">788</a></th><td>    ),
</td></tr><tr><th id="L789"><a href="#L789">789</a></th><td>    'TXN-' || upper(substr(md5(gs.i::text), 1, 10)),
</td></tr><tr><th id="L790"><a href="#L790">790</a></th><td>    (ARRAY['pending','completed','failed','refunded','partially_refunded'])[(abs(hashint4(gs.i * 13)) % 5) + 1]
</td></tr><tr><th id="L791"><a href="#L791">791</a></th><td>FROM generate_series(1, 1000000) gs(i)
</td></tr><tr><th id="L792"><a href="#L792">792</a></th><td>CROSS JOIN res_array;
</td></tr><tr><th id="L793"><a href="#L793">793</a></th><td>
</td></tr><tr><th id="L794"><a href="#L794">794</a></th><td>--22.ReservationSttaus-------------------------------
</td></tr><tr><th id="L795"><a href="#L795">795</a></th><td>INSERT INTO ReservationStatus (
</td></tr><tr><th id="L796"><a href="#L796">796</a></th><td>    ReservationreservationId,
</td></tr><tr><th id="L797"><a href="#L797">797</a></th><td>    refund_amount,
</td></tr><tr><th id="L798"><a href="#L798">798</a></th><td>    cancellation_date
</td></tr><tr><th id="L799"><a href="#L799">799</a></th><td>)
</td></tr><tr><th id="L800"><a href="#L800">800</a></th><td>SELECT
</td></tr><tr><th id="L801"><a href="#L801">801</a></th><td>    r.reservationId,
</td></tr><tr><th id="L802"><a href="#L802">802</a></th><td>
</td></tr><tr><th id="L803"><a href="#L803">803</a></th><td>    CASE
</td></tr><tr><th id="L804"><a href="#L804">804</a></th><td>        WHEN r.reservation_status = 'cancelled'
</td></tr><tr><th id="L805"><a href="#L805">805</a></th><td>            THEN round((r.total_price * random())::numeric, 2)
</td></tr><tr><th id="L806"><a href="#L806">806</a></th><td>        ELSE 0
</td></tr><tr><th id="L807"><a href="#L807">807</a></th><td>    END,
</td></tr><tr><th id="L808"><a href="#L808">808</a></th><td>
</td></tr><tr><th id="L809"><a href="#L809">809</a></th><td>    CASE
</td></tr><tr><th id="L810"><a href="#L810">810</a></th><td>        WHEN r.reservation_status = 'cancelled'
</td></tr><tr><th id="L811"><a href="#L811">811</a></th><td>            THEN LEAST(
</td></tr><tr><th id="L812"><a href="#L812">812</a></th><td>                r.created_at + (floor(random() * 5))::int,
</td></tr><tr><th id="L813"><a href="#L813">813</a></th><td>                CURRENT_DATE
</td></tr><tr><th id="L814"><a href="#L814">814</a></th><td>            )
</td></tr><tr><th id="L815"><a href="#L815">815</a></th><td>        ELSE NULL
</td></tr><tr><th id="L816"><a href="#L816">816</a></th><td>    END
</td></tr><tr><th id="L817"><a href="#L817">817</a></th><td>
</td></tr><tr><th id="L818"><a href="#L818">818</a></th><td>FROM Reservation r;
</td></tr><tr><th id="L819"><a href="#L819">819</a></th><td>
</td></tr><tr><th id="L820"><a href="#L820">820</a></th><td>SELECT COUNT(*) FROM Reservation WHERE reservation_status = 'cancelled';
</td></tr><tr><th id="L821"><a href="#L821">821</a></th><td>select distinct count(cancellation_date) from reservationstatus;
</td></tr><tr><th id="L822"><a href="#L822">822</a></th><td>SELECT * FROM ReservationStatus WHERE cancellation_date IS NOT NULL LIMIT 100;
</td></tr><tr><th id="L823"><a href="#L823">823</a></th><td>
</td></tr><tr><th id="L824"><a href="#L824">824</a></th><td>--23. ReservationActivity------------------------------------
</td></tr><tr><th id="L825"><a href="#L825">825</a></th><td>WITH
</td></tr><tr><th id="L826"><a href="#L826">826</a></th><td>res AS (
</td></tr><tr><th id="L827"><a href="#L827">827</a></th><td>    SELECT array_agg(reservationId) AS arr, count(*) AS cnt
</td></tr><tr><th id="L828"><a href="#L828">828</a></th><td>    FROM Reservation
</td></tr><tr><th id="L829"><a href="#L829">829</a></th><td>),
</td></tr><tr><th id="L830"><a href="#L830">830</a></th><td>act AS (
</td></tr><tr><th id="L831"><a href="#L831">831</a></th><td>    SELECT array_agg(activity_id) AS arr, count(*) AS cnt
</td></tr><tr><th id="L832"><a href="#L832">832</a></th><td>    FROM Activity
</td></tr><tr><th id="L833"><a href="#L833">833</a></th><td>)
</td></tr><tr><th id="L834"><a href="#L834">834</a></th><td>
</td></tr><tr><th id="L835"><a href="#L835">835</a></th><td>INSERT INTO ReservationActivity (
</td></tr><tr><th id="L836"><a href="#L836">836</a></th><td>    Activityactivity_id,
</td></tr><tr><th id="L837"><a href="#L837">837</a></th><td>    ReservationreservationId,
</td></tr><tr><th id="L838"><a href="#L838">838</a></th><td>    number_of_participants,
</td></tr><tr><th id="L839"><a href="#L839">839</a></th><td>    total_price_for_activity,
</td></tr><tr><th id="L840"><a href="#L840">840</a></th><td>    status,
</td></tr><tr><th id="L841"><a href="#L841">841</a></th><td>    booking_date
</td></tr><tr><th id="L842"><a href="#L842">842</a></th><td>)
</td></tr><tr><th id="L843"><a href="#L843">843</a></th><td>SELECT
</td></tr><tr><th id="L844"><a href="#L844">844</a></th><td>    act.arr[1 + (gs.i % act.cnt)],
</td></tr><tr><th id="L845"><a href="#L845">845</a></th><td>    res.arr[1 + (gs.i % res.cnt)],
</td></tr><tr><th id="L846"><a href="#L846">846</a></th><td>
</td></tr><tr><th id="L847"><a href="#L847">847</a></th><td>    (1 + floor(random() * 5))::int,
</td></tr><tr><th id="L848"><a href="#L848">848</a></th><td>    round((10 + random() * 200)::numeric, 2),
</td></tr><tr><th id="L849"><a href="#L849">849</a></th><td>
</td></tr><tr><th id="L850"><a href="#L850">850</a></th><td>    (ARRAY['booked','completed','cancelled'])
</td></tr><tr><th id="L851"><a href="#L851">851</a></th><td>        [1 + floor(random() * 3)],
</td></tr><tr><th id="L852"><a href="#L852">852</a></th><td>
</td></tr><tr><th id="L853"><a href="#L853">853</a></th><td>    CURRENT_DATE - (floor(random() * 365))::int
</td></tr><tr><th id="L854"><a href="#L854">854</a></th><td>
</td></tr><tr><th id="L855"><a href="#L855">855</a></th><td>FROM generate_series(1, 15000000) gs(i)
</td></tr><tr><th id="L856"><a href="#L856">856</a></th><td>CROSS JOIN act
</td></tr><tr><th id="L857"><a href="#L857">857</a></th><td>CROSS JOIN res;
</td></tr><tr><th id="L858"><a href="#L858">858</a></th><td>
</td></tr><tr><th id="L859"><a href="#L859">859</a></th><td>select * from reservationactivity;
</td></tr><tr><th id="L860"><a href="#L860">860</a></th><td>
</td></tr><tr><th id="L861"><a href="#L861">861</a></th><td>--24. EquipmentRental--------------------------
</td></tr><tr><th id="L862"><a href="#L862">862</a></th><td>INSERT INTO EquipmentRental (
</td></tr><tr><th id="L863"><a href="#L863">863</a></th><td>    EquipmentequipmentId,
</td></tr><tr><th id="L864"><a href="#L864">864</a></th><td>    ReservationreservationId,
</td></tr><tr><th id="L865"><a href="#L865">865</a></th><td>    quantity,
</td></tr><tr><th id="L866"><a href="#L866">866</a></th><td>    start_date,
</td></tr><tr><th id="L867"><a href="#L867">867</a></th><td>    end_date,
</td></tr><tr><th id="L868"><a href="#L868">868</a></th><td>    total_price,
</td></tr><tr><th id="L869"><a href="#L869">869</a></th><td>    deposit_paid,
</td></tr><tr><th id="L870"><a href="#L870">870</a></th><td>    status
</td></tr><tr><th id="L871"><a href="#L871">871</a></th><td>)
</td></tr><tr><th id="L872"><a href="#L872">872</a></th><td>WITH
</td></tr><tr><th id="L873"><a href="#L873">873</a></th><td>eq AS (
</td></tr><tr><th id="L874"><a href="#L874">874</a></th><td>    SELECT array_agg(equipmentId) AS arr, count(*) AS cnt
</td></tr><tr><th id="L875"><a href="#L875">875</a></th><td>    FROM Equipment
</td></tr><tr><th id="L876"><a href="#L876">876</a></th><td>),
</td></tr><tr><th id="L877"><a href="#L877">877</a></th><td>res AS (
</td></tr><tr><th id="L878"><a href="#L878">878</a></th><td>    SELECT array_agg(reservationId) AS arr, count(*) AS cnt
</td></tr><tr><th id="L879"><a href="#L879">879</a></th><td>    FROM Reservation
</td></tr><tr><th id="L880"><a href="#L880">880</a></th><td>)
</td></tr><tr><th id="L881"><a href="#L881">881</a></th><td>SELECT
</td></tr><tr><th id="L882"><a href="#L882">882</a></th><td>    eq.arr[1 + (gs.i % eq.cnt::int)],
</td></tr><tr><th id="L883"><a href="#L883">883</a></th><td>    res.arr[1 + (gs.i % res.cnt::int)],
</td></tr><tr><th id="L884"><a href="#L884">884</a></th><td>    (1 + abs(hashint4(gs.i * 3)) % 5)::int,
</td></tr><tr><th id="L885"><a href="#L885">885</a></th><td>    CURRENT_DATE - (abs(hashint4(gs.i * 7)) % 365),
</td></tr><tr><th id="L886"><a href="#L886">886</a></th><td>    CURRENT_DATE - (abs(hashint4(gs.i * 7)) % 365) + (1 + abs(hashint4(gs.i * 11)) % 14),
</td></tr><tr><th id="L887"><a href="#L887">887</a></th><td>    (10 + abs(hashint4(gs.i * 13)) % 200)::numeric,
</td></tr><tr><th id="L888"><a href="#L888">888</a></th><td>    (abs(hashint4(gs.i * 17)) % 100)::numeric,
</td></tr><tr><th id="L889"><a href="#L889">889</a></th><td>    (ARRAY['active','returned','overdue','cancelled','damaged'])[(abs(hashint4(gs.i * 19)) % 5) + 1]
</td></tr><tr><th id="L890"><a href="#L890">890</a></th><td>FROM generate_series(1, 5000000) gs(i)
</td></tr><tr><th id="L891"><a href="#L891">891</a></th><td>CROSS JOIN eq
</td></tr><tr><th id="L892"><a href="#L892">892</a></th><td>CROSS JOIN res;
</td></tr><tr><th id="L893"><a href="#L893">893</a></th><td>
</td></tr><tr><th id="L894"><a href="#L894">894</a></th><td>--25.review---------------------------
</td></tr><tr><th id="L895"><a href="#L895">895</a></th><td>INSERT INTO Review (
</td></tr><tr><th id="L896"><a href="#L896">896</a></th><td>    CampLocationcampLocationId,
</td></tr><tr><th id="L897"><a href="#L897">897</a></th><td>    GuestUseruserId,
</td></tr><tr><th id="L898"><a href="#L898">898</a></th><td>    review_date,
</td></tr><tr><th id="L899"><a href="#L899">899</a></th><td>    comment,
</td></tr><tr><th id="L900"><a href="#L900">900</a></th><td>    rating
</td></tr><tr><th id="L901"><a href="#L901">901</a></th><td>)
</td></tr><tr><th id="L902"><a href="#L902">902</a></th><td>WITH guest_array AS (
</td></tr><tr><th id="L903"><a href="#L903">903</a></th><td>    SELECT array_agg(UseruserId) AS ids, count(*) AS cnt
</td></tr><tr><th id="L904"><a href="#L904">904</a></th><td>    FROM Guest
</td></tr><tr><th id="L905"><a href="#L905">905</a></th><td>),
</td></tr><tr><th id="L906"><a href="#L906">906</a></th><td>camp_array AS (
</td></tr><tr><th id="L907"><a href="#L907">907</a></th><td>    SELECT array_agg(campLocationId) AS ids, count(*) AS cnt
</td></tr><tr><th id="L908"><a href="#L908">908</a></th><td>    FROM CampLocation
</td></tr><tr><th id="L909"><a href="#L909">909</a></th><td>)
</td></tr><tr><th id="L910"><a href="#L910">910</a></th><td>SELECT
</td></tr><tr><th id="L911"><a href="#L911">911</a></th><td>    ca.ids[1 + (gs.i % ca.cnt::int)],
</td></tr><tr><th id="L912"><a href="#L912">912</a></th><td>    ga.ids[1 + (gs.i % ga.cnt::int)],
</td></tr><tr><th id="L913"><a href="#L913">913</a></th><td>    CURRENT_DATE - (abs(hashint4(gs.i * 7)) % 365),
</td></tr><tr><th id="L914"><a href="#L914">914</a></th><td>    CASE (abs(hashint4(gs.i * 3)) % 5) + 1
</td></tr><tr><th id="L915"><a href="#L915">915</a></th><td>        WHEN 5 THEN 'Amazing place! Everything was perfect'
</td></tr><tr><th id="L916"><a href="#L916">916</a></th><td>        WHEN 4 THEN 'Very nice location, enjoyed the stay'
</td></tr><tr><th id="L917"><a href="#L917">917</a></th><td>        WHEN 3 THEN 'Average experience'
</td></tr><tr><th id="L918"><a href="#L918">918</a></th><td>        WHEN 2 THEN 'Could be better'
</td></tr><tr><th id="L919"><a href="#L919">919</a></th><td>        WHEN 1 THEN 'Very disappointing stay'
</td></tr><tr><th id="L920"><a href="#L920">920</a></th><td>    END,
</td></tr><tr><th id="L921"><a href="#L921">921</a></th><td>    (abs(hashint4(gs.i * 3)) % 5) + 1
</td></tr><tr><th id="L922"><a href="#L922">922</a></th><td>FROM generate_series(1, 100000) gs(i)
</td></tr><tr><th id="L923"><a href="#L923">923</a></th><td>CROSS JOIN guest_array ga
</td></tr><tr><th id="L924"><a href="#L924">924</a></th><td>CROSS JOIN camp_array ca;
</td></tr><tr><th id="L925"><a href="#L925">925</a></th><td>
</td></tr><tr><th id="L926"><a href="#L926">926</a></th><td>
</td></tr><tr><th id="L927"><a href="#L927">927</a></th><td>
</td></tr><tr><th id="L928"><a href="#L928">928</a></th><td>--26. ActivityReview--------------------------
</td></tr><tr><th id="L929"><a href="#L929">929</a></th><td>INSERT INTO ActivityReview (
</td></tr><tr><th id="L930"><a href="#L930">930</a></th><td>    GuestUseruserId,
</td></tr><tr><th id="L931"><a href="#L931">931</a></th><td>    Activityactivity_id,
</td></tr><tr><th id="L932"><a href="#L932">932</a></th><td>    rating,
</td></tr><tr><th id="L933"><a href="#L933">933</a></th><td>    comment,
</td></tr><tr><th id="L934"><a href="#L934">934</a></th><td>    review_date
</td></tr><tr><th id="L935"><a href="#L935">935</a></th><td>)
</td></tr><tr><th id="L936"><a href="#L936">936</a></th><td>WITH guest_array AS (
</td></tr><tr><th id="L937"><a href="#L937">937</a></th><td>    SELECT array_agg(UseruserId) AS ids, count(*) AS cnt
</td></tr><tr><th id="L938"><a href="#L938">938</a></th><td>    FROM Guest
</td></tr><tr><th id="L939"><a href="#L939">939</a></th><td>),
</td></tr><tr><th id="L940"><a href="#L940">940</a></th><td>activity_array AS (
</td></tr><tr><th id="L941"><a href="#L941">941</a></th><td>    SELECT array_agg(activity_id) AS ids, count(*) AS cnt
</td></tr><tr><th id="L942"><a href="#L942">942</a></th><td>    FROM Activity
</td></tr><tr><th id="L943"><a href="#L943">943</a></th><td>)
</td></tr><tr><th id="L944"><a href="#L944">944</a></th><td>SELECT
</td></tr><tr><th id="L945"><a href="#L945">945</a></th><td>    ga.ids[1 + (gs.i % ga.cnt::int)],
</td></tr><tr><th id="L946"><a href="#L946">946</a></th><td>    aa.ids[1 + (gs.i % aa.cnt::int)],
</td></tr><tr><th id="L947"><a href="#L947">947</a></th><td>    (abs(hashint4(gs.i * 3)) % 5) + 1,
</td></tr><tr><th id="L948"><a href="#L948">948</a></th><td>    CASE (abs(hashint4(gs.i * 3)) % 5) + 1
</td></tr><tr><th id="L949"><a href="#L949">949</a></th><td>        WHEN 5 THEN 'Amazing experience! Highly recommended!'
</td></tr><tr><th id="L950"><a href="#L950">950</a></th><td>        WHEN 4 THEN 'Very good activity, would do again'
</td></tr><tr><th id="L951"><a href="#L951">951</a></th><td>        WHEN 3 THEN 'It was okay, nothing special'
</td></tr><tr><th id="L952"><a href="#L952">952</a></th><td>        WHEN 2 THEN 'Not very satisfied'
</td></tr><tr><th id="L953"><a href="#L953">953</a></th><td>        WHEN 1 THEN 'Terrible experience'
</td></tr><tr><th id="L954"><a href="#L954">954</a></th><td>    END,
</td></tr><tr><th id="L955"><a href="#L955">955</a></th><td>    CURRENT_DATE - (abs(hashint4(gs.i * 7)) % 365)
</td></tr><tr><th id="L956"><a href="#L956">956</a></th><td>FROM generate_series(1, 200000) gs(i)
</td></tr><tr><th id="L957"><a href="#L957">957</a></th><td>CROSS JOIN guest_array ga
</td></tr><tr><th id="L958"><a href="#L958">958</a></th><td>CROSS JOIN activity_array aa;
</td></tr><tr><th id="L959"><a href="#L959">959</a></th><td>
</td></tr><tr><th id="L960"><a href="#L960">960</a></th><td>
</td></tr><tr><th id="L961"><a href="#L961">961</a></th><td>--27. Message------------------------------
</td></tr><tr><th id="L962"><a href="#L962">962</a></th><td>INSERT INTO "Message" (
</td></tr><tr><th id="L963"><a href="#L963">963</a></th><td>    UseruserId,
</td></tr><tr><th id="L964"><a href="#L964">964</a></th><td>    senderId,
</td></tr><tr><th id="L965"><a href="#L965">965</a></th><td>    receiverId,
</td></tr><tr><th id="L966"><a href="#L966">966</a></th><td>    content,
</td></tr><tr><th id="L967"><a href="#L967">967</a></th><td>    sent_time
</td></tr><tr><th id="L968"><a href="#L968">968</a></th><td>)
</td></tr><tr><th id="L969"><a href="#L969">969</a></th><td>WITH u AS (
</td></tr><tr><th id="L970"><a href="#L970">970</a></th><td>    SELECT array_agg(user_id) AS arr, count(*) AS cnt
</td></tr><tr><th id="L971"><a href="#L971">971</a></th><td>    FROM "User"
</td></tr><tr><th id="L972"><a href="#L972">972</a></th><td>)
</td></tr><tr><th id="L973"><a href="#L973">973</a></th><td>SELECT
</td></tr><tr><th id="L974"><a href="#L974">974</a></th><td>    s.id,
</td></tr><tr><th id="L975"><a href="#L975">975</a></th><td>    s.id,
</td></tr><tr><th id="L976"><a href="#L976">976</a></th><td>    r.id,
</td></tr><tr><th id="L977"><a href="#L977">977</a></th><td>    'M-' || gs.i,
</td></tr><tr><th id="L978"><a href="#L978">978</a></th><td>    (now() - (abs(hashint4(gs.i * 7)) % 86400) * interval '1 second')::time
</td></tr><tr><th id="L979"><a href="#L979">979</a></th><td>FROM generate_series(1, 10000000) gs(i)
</td></tr><tr><th id="L980"><a href="#L980">980</a></th><td>CROSS JOIN u
</td></tr><tr><th id="L981"><a href="#L981">981</a></th><td>JOIN LATERAL (SELECT u.arr[1 + (gs.i % u.cnt::int)] AS id) s ON true
</td></tr><tr><th id="L982"><a href="#L982">982</a></th><td>JOIN LATERAL (SELECT u.arr[1 + ((gs.i + 7) % u.cnt::int)] AS id) r ON true
</td></tr><tr><th id="L983"><a href="#L983">983</a></th><td>WHERE s.id &lt;&gt; r.id;
</td></tr><tr><th id="L984"><a href="#L984">984</a></th><td>
</td></tr><tr><th id="L985"><a href="#L985">985</a></th><td>
</td></tr><tr><th id="L986"><a href="#L986">986</a></th><td>--28.user_message_receiver-----------------------------------
</td></tr><tr><th id="L987"><a href="#L987">987</a></th><td>INSERT INTO user_message_receiver (UseruserId, MessagemessageId)
</td></tr><tr><th id="L988"><a href="#L988">988</a></th><td>WITH user_array AS (
</td></tr><tr><th id="L989"><a href="#L989">989</a></th><td>    SELECT array_agg(user_id) AS ids, count(*) AS cnt
</td></tr><tr><th id="L990"><a href="#L990">990</a></th><td>    FROM "User"
</td></tr><tr><th id="L991"><a href="#L991">991</a></th><td>)
</td></tr><tr><th id="L992"><a href="#L992">992</a></th><td>SELECT
</td></tr><tr><th id="L993"><a href="#L993">993</a></th><td>    ids[1 + (m.messageId % cnt::int)],
</td></tr><tr><th id="L994"><a href="#L994">994</a></th><td>    m.messageId
</td></tr><tr><th id="L995"><a href="#L995">995</a></th><td>FROM "Message" m
</td></tr><tr><th id="L996"><a href="#L996">996</a></th><td>CROSS JOIN user_array;</td></tr></tbody></table>

      </div>
      <div class="buttons">
        <form method="get" action="/projects/camper/attachment/wiki/DatabaseCreation/dml.sql">
          <div id="delete">             <input type="hidden" name="action" value="delete" />
            <input type="submit" value="Delete attachment" />
          </div>
        </form>
      </div>
    </div>
        <!-- # block content (content inherited from layout.html) -->
    <script type="text/javascript">
      jQuery("body").addClass("trac-has-js");
    </script>
    <div id="altlinks">
      <h3>Download in other formats:</h3>
      <ul>
        <li class="first last">
          <a rel="nofollow" href="/projects/camper/raw-attachment/wiki/DatabaseCreation/dml.sql"
              class="">
            Original Format</a>
        </li>
      </ul>
    </div>
    <!-- # endblock content (content inherited from layout.html) -->

      <!-- # endblock content (placeholder in theme.html) -->
    </div>

    <div id="footer"><hr/>
      <a id="tracpowered" href="https://trac.edgewall.org/"
         ><img src="/projects/camper/chrome/common/trac_logo_mini.png" height="30"
               width="107" alt="Trac Powered"/></a>
      <p class="left">
Powered by         <a href="/projects/camper/about"><strong>Trac 1.6</strong></a>
        <br />
 By         <a href="http://www.edgewall.org/">Edgewall Software</a>
.      </p>
      <p class="right">Visit the Trac open source project at<br /><a href="https://trac.edgewall.org/">https://trac.edgewall.org/</a></p>
    </div>
    <!--   # include 'site_footer.html' (theme.html) -->
    <!--   end of site_footer.html -->
    <!-- # endblock body (content inherited from theme.html) -->
  </body> </html>