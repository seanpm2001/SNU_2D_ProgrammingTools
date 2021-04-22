
Skip to content
Pull requests
Issues
Marketplace
Explore
@seanpm2001
google /
blockly

478
9k

    3k

Code
Issues 419
Pull requests 21
Actions
Projects 1
Wiki
Security

    Insights

Releases
Tags
Latest release

5.20210325.1
3fe56b0

Q1 2021 Patch 1

@alschmiedt alschmiedt released this 8 days ago

Patch release containing #4778
Assets 2
Source code (zip)
Source code (tar.gz)

5.20210325.0
a61109c

Q1 2021

@maribethb maribethb released this 27 days ago
In this release (Q1 2021)

This is a major release. Notable changes:

    Keyboard navigation has been removed from core and moved to blockly-samples
    Changes to scroll to support single-direction scrollbars

For a full list of pull requests in this release, see #4735
API Changes

    Removal of keyboard navigation from core (#4593)
    Changes to Metrics definitions (#4652)

Issues closed:

    Events documentation references old event names (#4728)
    Shortcuts do not work in advanced compilation (#4723)
    [Blockly Playground][RTL] When flyout is zoomed in at its maximum then it gets difficult to zoom out and the playground does not show up (#4716)
    Events documentation does not include Workspace Comment Events (#4528)
    Mutator has flyout (#4698)
    Flyout scrollbar does not reposition properly on zoom (#4692)
    Flyout contains little top padding (#4655)
    setScale causes unexpected scroll (#4654)
    Can I get a copy event listener and get the copied target block (#4640)
    Block moves erratically when dragged a small amount (#4636)
    can`t change the style of label by using the demo and guide (#4621)
    Blockly.setLocale do not translate all block (#4617)
    Clarify type checking in statement stacks (#4609)
    How to dynamically generate dropdown options? (#4606)
    Use registry to instantiate flyout from workspace svg (#4589)
    Update Blockly.inject type for JSON toolbox in (#4587)
    create generator (#4579)
    Block.interpolate_ calls the FieldLabel constructor directly instead of through the registry (#4575)
    Fix .gcloudignore file (#4565)
    goog.inherits in custom fields documentation (#4559)
    Children of collapsed block are not enabled correctly (#4536)
    Update jsdom version (#4535)
    Events documentation does not include Workspace Comment Events (#4528)
    Script to release beta version (#4507)
    CVE-2018-16487 (#4473)
    CVE-2020-8203 (#4472)
    CVE-2019-10744 (#4471)
    Workspace constructor expects plugin option to exist (#4429)
    Add link to new keyboard nav demo (#4420)
    Dynamic dropdown "forgets" option keys when reloaded (#2135)
    Enable scrolling in only one direction (#1292)
    Zoom-center is wrong with an always-open flyout (#989)
    zoomToFit is broken when workspace has no scrollbars and blocks have negative coordinates (#944)
    Flyout contentTop should not be zero (#349)

Assets 2
Source code (zip)
Source code (tar.gz)

4.20201217.0
fd239e4

Q4 2020

@alschmiedt alschmiedt released this on Dec 17, 2020
In this release (Q4 2020)

This is a major release.

    UI Events refactor. Forum Post.
    Keyboard shortcuts (documentation to come)
    Deletion of previously deprecated functions

This release had 155 PRs. For a full list of pull requests in this issue, see #4548.
API Changes

    Remove deprecated functions in comment.js (4496)
    Remove deprecated field functions (4489)
    Keyboard shortcuts (4421)
    Refactoring Ui events in core (4418)
    Update access level of methods in FieldTextInput (4359)
    Remove ORDER_COMMA from PHP generator. (4357)
    Delete some deprecated functions (4330)
    factor out getX and getY methods for flyout (4463)

Issues closed in this release

    Feature: block for create list from range (4539)
    Obtain function inside domToMutation not recognized and giving a "Blockly.Block.obtain is not a function" error (4516)
    Blockly playground doesn't work in iOS 12 (4510)
    Demos > Custom Fields > Pitch Field: textAreaChange is not defined (4509)
    Break/continue block does not react to movements of the parent block (4500)
    Function mutator flyouts to not update (new events?) (4499)
    Remove all December 2020 deprecated functions (4481)
    More bugs in full screen mode (4476)
    Text and input field fills are black when painting the SVG to a canvas (4474)
    Update the language dropdown on documentation (devsite) (4462)
    Mutator regressions (4448)
    field image click event not work (4446)
    The link of closure-compiler-vxxxxxxxx.jar for download is broken (4442)
    Ability to make block with infinite / unlimited inputs (4435)
    Wrong path separators in uncompressed build on Windows (4433)
    Custom note field can't be edited on mobile (4430)
    Is it possible to copy a block to another tab in the browser? (4424)
    Block ID not available on its SVG Group in IE (4419)
    Blocks unexpectedly scrolled up or down (4414)
    both mouse and rat should appear in a rodents list (4411)
    Dropdown broken in Graph demo (4403)
    Rebuild error (4402)
    Refactor Flyout.position to allow for easy override (4396)
    Cannot drag blocks or interact with fields (4381)
    Dynamic arguments and type check (4374)
    Document the multiline input field (4367)
    many warnings when blockly is loaded after document ready state is set to complete (4358)
    Text fields are red sometimes on valid input (4345)
    how to Remove horizontal scrollbar in the workspace in blockly (4343)
    Blockly Developer Tools - No Preview Displayed (4339)
    [2020Q3]Repeated switch toolbar grouping causes the workspace position to jump (4338)
    Can't set some css classes for categories defined in xml (4335)
    updateGithubPages script sometimes fails due to merge conflicts (4322)
    Library blocks call bumpNeighbors in headless mode which triggers warning (4312)
    Punctuation marks not displayed appropriately for the tooltip text while hovering the blocks _RTL all toolboxPositions (4305)
    Add documentation for new context menu registry (4283)
    Change in Geras rendering for bottom notch in statement input (4282)
    The undo feature + Blockly.Events.disableOrphans = strange behaviour (4261)
    Refactor field tests in core (4260)
    Add a makeFlyoutOptions method (4247)
    Field calls calls the deprecated method classValidator (4197)
    Comment calls deprecated getText method (4186)
    Insertion Marker Serialization Tests failing (4116)
    Workspace is not always disposed in mocha tests (4080)
    Update type checks page to describe the connection checker (4076)
    Deprecation warning util (4049)
    Look into toolbox code performance (3985)
    Trashcan Fires Workspace Click Event (3975)
    Inconsistent default name set in init for procedure_callnoreturn and procedure_callreturn (3948)
    Configuring the used locale (for Blockly Web at least) is largely undocumented (3801)
    Textarea of comment missing scrollbars (3596)
    Toolbox suffers from code bloat (3056)
    Comments Access Warning Members They Probably Shouldn't (2943)
    TypedVariables category is not in StandardCategories.categoryMap. (2408)
    Insertion markers affect mutators (2354)
    Default text in comment should probably get selected when the comment is created for easy editing (1863)
    Feature request: Support css classnames for blocks (1850)
    Events for viewport changes (1052)

Assets 2
Source code (zip)
Source code (tar.gz)

3.20200924.4
85874cd

Q3 2020 Patch 4

@alschmiedt alschmiedt released this on Oct 30, 2020

Patch release containing #4422
Assets 2
Source code (zip)
Source code (tar.gz)
on Oct 30, 2020
3

Merge pull request #4422 from alschmiedt/flyout_patch
Flyout patch release

85874cd zip

    tar.gz 

3.20200924.3
31ee4ea

Q3 2020 Patch 3

@alschmiedt alschmiedt released this on Oct 12, 2020

Patch release containing #4360 and #4366
Assets 2
Source code (zip)
Source code (tar.gz)

3.20200924.2
11987dc

Q3 2020 Patch 2

@alschmiedt alschmiedt released this on Sep 30, 2020

Patch release containing #4334, #4336, #4340
Assets 2
Source code (zip)
Source code (tar.gz)

3.20200924.1
23c28a0

Q3 2020 Patch 1

@alschmiedt alschmiedt released this on Sep 28, 2020

Patch release containing #4327.
Assets 2
Source code (zip)
Source code (tar.gz)

3.20200924.0
8d5d2be

Q3 2020

@moniika moniika released this on Sep 24, 2020
In this release (Q3 2020)

    Toolbox refactor: Replaces the old closure toolbox with a new toolbox that is easier to extend and work with. Adds the ability to:
        Define a toolbox with JSON barring some performance issues (more info to come)
        Register a custom toolbox, flyout, and toolbox item
        Hide and disable a category
        Change the classes for the category
    Workspace click events (WARNING, may change in following release)
    Ability to register/unregister context menu options for blocks and workspaces via the ContextMenuRegistry

This release had 240 PRs. For a full list of pull requests in this issue, see #4319.
API Changes

    Rename trashcan api calls for open/close lid. (4110)
    Add option sub types (4096)
    Move events into the global registry (4053)
    Remove some old deprecated functions (4029)
    Update click event handling for workspace and trashcan. (4024)

Issues closed in this release

    Dragging block from trashcan flyout on mobile is not working (4303)
    blocks appear on themselves when their count is more than 150 (4297)
    Custom PHP Function to Blockly Block (4255)
    Add getter for tooltip (4252)
    Add Enum for toolbox position (4246)
    Code demo sized incorrectly when switching to certain languages (4245)
    QUESTION: this.appendAddSubGroup (4236)
    Dropdown inputs suddenly getting a 'black' background after value changes (4178)
    Clicking gear of "if" block makes the block fly far away (4175)
    Custom Elements - isTargetInput fails (4157)
    Toolbox (simple and category) sizes do not get updated properly (4138)
    Investigate intermittent Travis CI errors (4127)
    Marked workspace tests failing (4113)
    FieldNumber does not respect precision for small precision values (4105)
    Refactor block_test.js Deserialization tests (4101)
    Add Pinch To Zoom Control Options (4097)
    Field date documentation should say to use the published package (4094)
    Error calling dispose on non-injected WorkspaceSvg (4091)
    Getter for value block output types (4087)
    Advanced Playground Not Working On Master (4074)
    Gamepad-based programming (4073)
    How can we create a treeview toolbox in blockly as in image any sample code or need guide to the docs (4072)
    This section of JS code how to automatically generate process graphics block (4071)
    Cleanup for asynchronous calls in Blockly tests (4070)
    Add cleanup for Events in mocha tests (4064)
    Add a footer with T&C on blockly-demos site/pages similar to https://developers.google.com/blockly (4063)
    Trashcan api cleanup (4061)
    Blockly.JavaScript.variableDB_ is undefined (4060)
    Disposing of insertion marker causes error in when handling BLOCK_DELETE event (4048)
    Toolbox categories scale when zooming (4047)
    Add a build script flag to run the strict type checker (4040)
    Cannot re-append a field after Input.removeField() (4037)
    Category UI event is not emitted when block is dragged from flyout (4034)
    Trashcan should emit UI event when flyout is closed (4033)
    domToText: Performance issue in large projects (4030)
    Allows flyout button callbacks to pass a parameter (4027)
    Moving a mutated block throws errors (4022)
    External images not working on dropdown input (4015)
    FieldDate is not included in the master branch (4013)
    Blockly dropdown causing strange resize problems (4012)
    Populate previous release metadata (4011)
    Update Advanced Compilation Documentation (4009)
    Error in Python Generator for "controls_for" block (4000)
    Multiline text field generator broken on IE 11 (3998)
    Update Configuring A Workspace (3990)
    Variable "propertyValue" of unknown origin (3987)
    Lua generator's multiline_quote_ produces invalid code (3979)
    Multiline literals are getting indented (3978)
    Flyout Fires Workspace Click Event (parent workspace id) (3976)
    Revert back programatic setShadow after release (3964)
    Document how to listen to events on all workspaces on the page (3946)
    Undo'ing a delete of a block with a shadow, loses shadow reference. (3929)
    Inconsistent behavior passing invalid values to constructor and fromJson (3903)
    Simple and fancy playgrounds (3882)
    Probably bad event order in createBlock (3584)
    When block has mutation, initModel is called before fromXml (3542)
    Dynamic toolbox category from list of block names (3376)
    Update or remove screenshot test code (3329)
    Consider using Greenkeeper (3268)
    Proposal: Standard dynamic plugin system for Blockly. (3260)
    Proposal: Pluggable common context menu items for BlockSvg (3237)
    Script for publishing release candidates to a github.io site (3208)
    Change Events before Create Event (2627)
    Add local option to build.py (2245)
    Add Undo/Redo buttons to playground and multi_playground (1947)
    Number field: change the value via mouse drag (1701)
    Add a 'strict' flag on connections (1357)
    Toolbox as .js files (1144)
    Unittest warns about prior definition of blocks (999)
    Warning thrown on some undo (968)
    Feature request: "Go to function definition" menu point (765)

Assets 2
Source code (zip)
Source code (tar.gz)

3.20200625.2
ba68081

Q2 2020 Patch 2

@alschmiedt alschmiedt released this on Jul 6, 2020

Patch release containing #4016.
Assets 2
Source code (zip)
Source code (tar.gz)

    © 2021 GitHub, Inc.
    Terms
    Privacy
    Security
    Status
    Docs

    Contact GitHub
    Pricing
    API
    Training
    Blog
    About


Skip to content
Pull requests
Issues
Marketplace
Explore
@seanpm2001
google /
blockly

478
9k

    3k

Code
Issues 419
Pull requests 21
Actions
Projects 1
Wiki
Security

    Insights

Releases
Tags

3.20200625.1
2874ceb

Q2 2020 Patch 1

@alschmiedt alschmiedt released this on Jun 26, 2020

Patch release containing #4004.
Assets 2
Source code (zip)
Source code (tar.gz)

3.20200625.0
93b5be4

Q2 2020

@alschmiedt alschmiedt released this on Jun 25, 2020
In this release (Q2 2020)

Some wonderful new tests
Support for flyout free mutators

**It is worth noting that there was some work done on being able to create a toolbox using JSON, but due to performance concerns we are not recommending or supporting this feature for the current release.

This release had 153 PRs. For a full list of pull requests in this issue, see #4002.
API Changes

    Register themes (3932)
    Simplify Closure-sourced code for menus (3880)
    Clean out the date field (3876)

Issues closed in this release

    Multiline text field generator broken on IE11 (3981)
    Is it possible to generate code on the server side? (3981)
    Is it possible to generate code on the server side? (3981)
    A quietable version of Input.removeField() (3967)
    Input.removeField(name) throws unsubstituted Error message (3966)
    Value missing while performing undo option in multi playground_Edge browser (3962)
    Disposing of a workspace while a mutator is open causes a crash (3957)
    Mutators without flyout blocks breaks with NPE on render (3955)
    Add Event to Support Closing Mutator On Click (3947)
    Add a function "workspace.refresh()" (3941)
    Error while using workspace.removeBlockById() (3940)
    "TextArea" that can input multiple lines (3939)
    Navigating toolbox using keyboard causes problem for custom flyouts (3936)
    [Help] Is possible the workspace canbe scrolled while the scrollbars set to false? (3921)
    Mutator Documentation Update (3919)
    How to use Blockly with VUE (3917)
    npm failed (3916)
    Drag a single block from a stack using ctrl-key (healstack) and put it back on top can result in error (3898)
    Mocha tests should use deepEqual for array equality (3897)
    Avoid handling navigation if we are currently dragging (3888)
    Add Blockly.Theme.register (3887)
    Questions RE commentIcon (3885)
    removeBlockById() won't remove blocks from my workspace! (3881)
    Shadows are darker (instead of lighter) when using default theme with zelos (3870)
    Add 'renderer' config property documentation (3869)
    Clarify Dropdown validator documentation (3866)
    Close the Mutator dialog bug (3865)
    Shadow blocks lose the mutationToDom (3860)
    Block instant search bar (3851)
    Update Theme Documentation (3839)
    remainingCapacityOfType does not respect maxInstance[type]=0 (3837)
    remainingCapacityOfType does not account for max block limit (3836)
    Field Dropdown and Field Variable options opening mispositioned when inside a compose/decompose mutator (3834)
    xml_test test case throws error after test run (3819)
    Create a metrics interface for the workspace getMetrics object (3817)
    Add properties to the Blockly.blockRendering.IPathObject interface (3816)
    Make Blockly.Variables.nameUsedWithAnyType_ public (3815)
    Blockly dropdown repeact options (3807)
    Make block.removeInput return a boolean (3803)
    Cannot read property 'svgPath' of undefined (3794)
    [Keyboard nav] keyboard press is captured by browser (3792)
    Collapsed blocks do not update when modified (3784)
    Extra padding on some dropdown fields on ios (3782)
    Keyboard Nav demo instructions out of date (3779)
    Flyout labels don't respect font size (3778)
    Unable to include new categories (3760)
    Input fields unresponsive in fullscreen mode (3758)
    Update Themes Documentation (3733)
    Row block in plane demo incorrect location after connecting (3639)
    Collapsed block text not updating (3619)
    Lua codegen of lists_getIndex block has problems with list literals (3566)
    Keyboard Nav: Basic Documentation (3531)
    Deleting the first of a chained input may error out if checks do not match (3392)
    Proposal: Download block image (3238)
    Expose Connection canConnectWithReason_ as public method (3218)
    Update documentation with how to configure a renderer (3012)
    onchange no more in Block definition ? (have to use this.setOnChange in init:) (2925)
    Download screenshot option (2914)
    Convert all JSunit tests to mocha (2870)
    Image Field Creation Doc Updates (2717)
    Document setOnClickHandler Function for Image Fields (2704)
    Update getPreviousBlock and getParent Documentation (2648)
    real time code generation incorrect while dragging? (2646)
    Speed up populating the dynamic procedure category (2579)
    Variables Page Documentation Updates (2502)
    Firefox 67.0 when block drag from toolbox, block not centred to mouse (2482)
    Document that statementToCode Should Only be Used Inside Generators (mostly) (2339)
    WorkspaceToDOM Includes Insertion Markers (2322)
    Add separate block shape curves for connectors (2258)
    Blockly interpretation of variables as global does not match runtime execution (1898)
    Typed variable documentation doesn't mention default types (1882)
    Add demo with +/- alternative mutator extensions for if/else, text_join, lists_create_empty, lists_repeat (1845)
    Document how to replace the mutator UI (1747)
    Typed variable creation modal (1606)
    Missing documentation for custom context menus (1358)
    Add Blockly.defineBlocksWithJsonArray to developer guides (1333)
    Publish developer tutorial (984)
    extract_json_blocks.py script to extract JSON from .js files (854)
    Documentation for creating a new generator (774)
    RFE: Add method to search blocks (766)
    Look at performance issues in mobile browsers (240)
    UX feature: Faster accessing of needed blocks (225)
    Keep the operator precedence when collapse a block (57)

Assets 2
Source code (zip)
Source code (tar.gz)

3.20200402.1
07762ff

Q1 2020 Patch 1

@samelhusseini samelhusseini released this on Apr 3, 2020

Patch release containing #3797.
Assets 2
Source code (zip)
Source code (tar.gz)

3.20200402.0
096d1c4

Q1 2020

@alschmiedt alschmiedt released this on Apr 2, 2020
In this release (Q4 2019)

    Theme updates
        Changing fonts
        Ability to add start hats to all blocks
        Support extending a base theme
    Added ability to override renderer constants in options

This release had 102 PRs. For a full list of pull requests in this issue, see #3789.
Issues closed in this release

Extra padding on some dropdown fields on ios (#3782)
Flyout labels don't respect font size (#3778)
Typo at ja.js (#3770)
Unable to include new categories (#3760)
Input fields unresponsive in fullscreen mode (#3758)
Output pop up shown twice on iPad for procedure testing (#3751)
Unable to edit field when keyboard nav cursor is on block (#3744)
Adding shadows to "any" inputs makes that input only accept the shadow output type (#3737)
Variable fail do detect global scope (#3728)
Blockly Developer-guides sidebar (#3726)
Insertion Markers shows wrong when changing "inline" default property (#3718)
Add custom blocks to blockly (npm) (#3717)
Procedure args do not handle casing correctly (#3711)
Display flex breaks measureFontMetrics (#3710)
Rendering RTL collapsed blocks in geras error (#3700)
Is there an official XSD that we can use to verify our blockly workspaces? (#3688)
Zelos multi-line blocks with output connections grow without a limit. (#3684)
Failed to run with Windows WebView API (#3683)
Child SVG remains in DOM when parent is collapsed (#3682)
Field Registration Doc Updates (#3678)
code generators arent working (#3677)
Zelos: Reporter block with statement input (#3676)
Keyboard Nav Cursor reappears when block moves (#3669)
Function to empty trash (#3666)
Self-closing tag in XML will break the resulting 'if' block (#3664)
"Zelos" the List field is not aligned properly (#3662)
path typo. (#3661)
Update custom fields documentation for updateColour->applyColour rename (#3660)
Warning text is hard to read (white-on-lightgreen) (#3657)
Flyouts are on the incorrect side of the screen (#3644)
Row block in plane demo incorrect location after connecting (#3639)
Turtles in turtle demo are black (#3636)
TextInput fields have extra padding in readonly (#3632)
Wrong cursor over text labels on block (#3617)
Filename in compile error message is off-by-one (OBO) (#3613)
Lua codegen of lists_getIndex block has problems with list literals (#3566)
chore(tools): add release-drafter.yml inside .github (#3555)
Deleting the first of a chained input may error out if checks do not match (#3392)
Dropdown are acting weird with screen readers (#3340)
Sizing of text inputs fields in mutator workspaces is broken (#3166)
Workspace drag performance regression (#3094)
Insertion Markers Do Not Properly Handle Typed Statement Connections (#2948)
Flyout Buttons with Different Font Size are Not Rendered Correctly (#2793)
Image Field Creation Doc Updates (#2717)
Document setOnClickHandler Function for Image Fields (#2704)
Add Dark Mode [FEATURE REQUEST] (#2639)
Disabling orphan break blocks breaks undo (#2321)
[Edge]: Field edit widget misaligned when browser page is zoomed. (#2032)
Code Demo: Edge stops responding to touch (#1942)
FieldInput on Win10: Overlay editor does not disappear when the user scrolls (#1685)
Right-click shows browser context menu on top of Blockly context menu (#1516)
Widget div doesn't change size with zoom level (#1335)
Clicking on blank space between toolbox items closes the item tree (#714)
Warning text resizes out of bubble (#510)
Support for custom BlockSvg tabs/notches (#174)
Possible Breaking Changes

CSS styling for renderers now contain additional selector for theme (eg: "classic-theme"). This might require you to update some of your custom CSS styling for Blockly so that it is properly applied.
Assets 2
Source code (zip)
Source code (tar.gz)
on Jan 24, 2020
3.20200123.1

Merge start hat fix into master (#3652)
* Fix start hats (#3651)

* Rebuild

249d484 zip

    tar.gz 

3.20200123.0
5734169

Q4 2019

@alschmiedt alschmiedt released this on Jan 23, 2020

The main focus for this release was completing Zelos rendering.
In this release (Q4 2019)

    Zelos Rendering
    Finalize Keyboard Navigation APIs

This was rlease had 375+ PRs. For a full list of pull requests in this issue, see #3611.
Issues closed in this release

VariableModel's getVariableTypes returns multiple empty string types. (#3593)
Dragging a collapsed function call block causes a crash if the function has inputs (#3589)
Dropdown option is immediately selected due to order of processing touch events (#3567)
Investigate how fields cache options (#3553)
Bottom horizontal flyout has broken delete areas (#3550)
[zelos] Overlap in block height when a statement block with no next connection is attached into a statement input. (#3546)
Scrolled text input widget div is positioned incorrectly (#3532)
Changing Style/Colour of Inherited disabled block has unexpected behaviour (#3530)
The width of the parent element is not enough, my light belt overflows (#3529)
Custom field, the width of parent element is not enough, overflow, how to solve it? (#3528)
Always use ConstantProvider.shapeFor() for rendering notches (#3522)
method updateToolbox keep the category state (#3520)
blocks_compressed.js generated by Gulp has bugs (#3518)
Calling setMutator programmatically does not rerender the block (#3510)
Mutating and Deleting a block is not updating Cursor properly (#3507)
Allow non-visible grids (#3503)
[zelos rendering] Multi-row reporters (#3494)
use Ctrl + z can delete moveable = false ,deleteable = false block (#3486)
Blocks with a field following a variable field break when a mutator is open (#3458)
the issue about local_build.sh (#3422)
Decide what to do about output shape on the block (#3414)
Keyboard Nav: Shift clicking shouldn't enter accessibility mode (#3412)
AppendDomToWorkspace positioning is wrong in RTL (#3408)
All stock blocks in Blockly Games now black. (#3397)
Multiple modifiers in key_map doesn't work right (#3375)
Keyboard Nav: Basic Cursor with ability to set validNode (#3371)
Statement input rendering: bar below input got longer (#3367)
Clicking workspace after comment resize causes a crash (#3364)
Minimalist renderer doesn't account for input alignment (#3361)
FieldImage cannot be navigated to when opt_clickHandler is passed (#3339)
Allow non-visible grids (#3503)
[zelos rendering] vertical tight nesting (#3495)
[zelos rendering] Multi-row reporters (#3494)
Block width incorrect for nested blocks (#3481)
JetBrains artifacts aren't gitignored (#3475)
Colour field not updated properly (#3473)
Dropdown arrow not coloured properly (#3472)
disable trashcan (and deleting) at runtime (for offline mode) (#3467)
unable to run blockly using npm run test, it keeps giving me this error (#3457)
The xml tag id auto generate should be from a-z 0-9 (#3453)
No longer able to tab out of Blockly (#3452)
Scrollen in Blockly (#3451)
Ask for help (#3450)
Novice question: how do you pass requirejs-based modules the results of running user-generated code (eval() of runJS) (#3449)
Unable to drag a warning bubble if mouse is over text (#3386)
Minimalist renderer doesn't account for input alignment (#3361)
AST should navigate to non editable fields (#3344)
Spacing between a field and input is different whether the field is before or after the input. (#3327)
Connection highlighting during drag always uses puzzle and notch shapes (#3236)
[zelos] Determine what to do with inline inputs. (#2978)
Exception when try to move blocks within blockly div when blocks start shaking (#2929)
Autoload blocks checkbox in playground (#3416)
shift-clicking a block creates some kind of selection marker (#3411)
Add the current theme to the DOM (#3407)
Blockly.Blocks can't be found in Blockly (#3406)
dropdown i18n breaken by space (#3398)
Deleting block throws error on small screens (#3393)
Advanced compilation test is now black and white. (#3382)
Move theme manager out of Blockly.Workspace (#3380)
Move filter and pattern creation into renderer (#3377)
Bad colour in deuteranopia theme (#3372)
Compute canvas is affecting page layout (#3368)
Mutator dialog don't update delete areas when moved. (#3354)
Object representation with Blockly (#3347)
Block.setstyle throws an error when block has no style name (#3343)
Value input before/after dummy input row height inconsistencies (#3341)
Blockly.bindEvent_ is deprecated, remove it's use internally (#3332)
Dummy input aligns only left (#3330)
Npm run build does not recognize a new file (#3328)
[zelos] Dyanmic output shapes aligned incorrectly (#3325)
Shadow blocks in modern theme have highlights (#3319)
How to customize fields with the blockly NPM package? (#3314)
Rendering bug on upgrading to Blockly 3 (#3313)
If statement doesn't update connections after mutation change (#3305)
BlockSvg.positionNewBlock is a dupe of BlockSvg.positionNearConnection (#3299)
Right corners in base renderer (#3296)
how to get new variables (#3291)
Blockly.BlockSvg.START_HAT is broken (#3279)
why? (#3262)
Keyboard Navigation: Dispatch event on cursor change (#3258)
blockly is not able to load after blockly_compressed.js file is updated recently (#3254)
Assets 2
Source code (zip)
Source code (tar.gz)

3.20191014.4
ba6dfd8

Q3 Patch 4

@samelhusseini samelhusseini released this on Oct 28, 2019

Patch release containing #3330.
Assets 2
Source code (zip)
Source code (tar.gz)

3.20191014.3
1a4c321

Q3 Patch 3

@samelhusseini samelhusseini released this on Oct 23, 2019

Patch release containing #3316.
Assets 2
Source code (zip)
Source code (tar.gz)

3.20191014.2
0a497a1

Q3 Patch 2

@rachel-fenichel rachel-fenichel released this on Oct 17, 2019

Patch release containing #3280.
Assets 2
Source code (zip)
Source code (tar.gz)

3.20191014.1
921e00b

Q3 2019 Patch 1

@rachel-fenichel rachel-fenichel released this on Oct 15, 2019

This is a patch release for the Q3 2019 release.

It fixes a typo in the block factory and a problem with angle fields.
Assets 2
Source code (zip)
Source code (tar.gz)

    © 2021 GitHub, Inc.
    Terms
    Privacy
    Security
    Status
    Docs

    Contact GitHub
    Pricing
    API
    Training
    Blog
    About



Skip to content
Pull requests
Issues
Marketplace
Explore
@seanpm2001
google /
blockly

478
9k

    3k

Code
Issues 419
Pull requests 21
Actions
Projects 1
Wiki
Security

    Insights

Releases
Tags

3.20191014.0
d35bc19

Q3 2019

@rachel-fenichel rachel-fenichel released this on Oct 14, 2019

This release is our second major version bump. After this we are returning the regularly scheduled minor bumps.
In this release (Q3 2019)

    Keyboard navigation APIs
    New rendering pipeline
    Removal of the Closure UI library
    Improvements in developer workflow
    Continuing cleanup in fields
    Many bugfixes

This was a big release with 650+ PRs. For a full list of pull requests in this issue, see #3165.
Issues closed in this release

Issues closed:

    Object.assign (ES6) in codebase (#3153)
    Visibility of bumpNeighbours breaks compiler (#3152)
    Base renderer issues (#3132)
    Uncaught typeError in workspaceCommentRenderSvg (#3106)
    Inline image dropdown too low. (#3098)
    Remove render debug and non-default renderers from default build (#3089)
    +/- buttons for dynamically extending value input list (#3078)
    Keyboard Nav: Interaction Between Mouse and Keyboard (#3071)
    Add the ability to make a read-only workspace writable (#3049)
    npm: new blocks instances appear below menuFlyout while dragging (#3032)
    Keyboard Nav: Cursor not showing correct location (#3028)
    Compile test is broken (#3027)
    Keyboard Nav: Cursor in RTL not working (#3024)
    Link in ReadME points to an invalid URL (#3021)
    Have a way to choose which renderers are included in your bundle (#3018)
    Unable to scroll the trash flyout without a mouse scroll (#3008)
    Drag in trash flyout causes error (#3007)
    Object.values not available in IE (#2999)
    Missing hideChaff in custom field demo? (#2998)
    block.dispose(/* healStack */ true) does not properly handle rows (#2991)
    Endmost value connections are not considered available (#2989)
    how to build package published on NPM (#2987)
    [zelos] Dynamic output shapes (#2977)
    How to compile project with local closure compiler? (#2975)
    Define a BlockRenderer object that Geras, Thrasos, and Zelos extend (#2966)
    Spacer calculation (#2964)
    Move DARK_PATH_OFFSET into Geras (#2956)
    Rendering highlights in RTL are broken (#2954)
    Slight difference in statement input connection location (#2952)
    Type checking for Measurables (#2946)
    topRow.populate and bottomRow.populate belong in info (#2945)
    Zelos bottom connection point not positioned correctly. (#2941)
    During domToWorkspace() child block with FieldDropdown is in workspace's topblock (#2926)
    Value or dummy after statement is broken. (#2921)
    Debug rendering isn't easy to turn on and off (#2904)
    Alignment issues (#2894)
    StartY and overhangY in top and bottom rows (#2866)
    Custom Fields demo is broken (#2862)
    Old Syntax transformation (#2859)
    Stop filtering subdirectories in the compile test script (#2838)
    Blocks with outputs misaligned in flyout (#2828)
    Block + children bounding boxes aren't always right (#2821)
    Text fields re-sizing is broken after the workspace regains visibility (#2811)
    blocks with hats zoom out of the toolbar (#2800)
    build function with typed arguments (#2797)
    Create and Delete Events Generate Lots of Detached Nodes (#2795)
    Text field editing in RTL resizes and positions incorrectly (#2777)
    Undo is broken with Ctrl + Z (#2765)
    Exception on doing pinch zoom over blocklyDiv (#2752)
    Compiler is broken (9 errors) (#2748)
    The DropDownDiv Should Respect Toolboxes (#2744)
    Replace closure toolbox categories with a custom implementation (#2735)
    Remove remaining closure ui components (#2734)
    Themes: Background Colour (#2733)
    Flyout Scrollbars Don't Scroll when you Drag the Flyout (#2728)
    Standardize Field Configuration (#2722)
    Field.text_: Documentation vs use (#2720)
    Decide how developers will choose their renderer (#2702)
    Custom Fields Not Working in Firefox (#2696)
    Block jittering on small workspaces (#2681)
    where XML id get confusing id="4H=DIk|U}:}a(%z9!(t:" x="112" y="113" (#2677)
    Toolbox buttons on the playground don't work in IE11 (#2672)
    Text is mismeasured on IE11 and Edge (#2671)
    Here is a live example of generator (#2665)
    Undoing a midstack delete hides blocks (#2660)
    Editing a number field on Android breaks dragging (#2659)
    blocks with relational joint setting (#2650)
    DOM html appoint you svga rights to render events not DOM (#2649)
    real time code generation incorrect while dragging? (#2646)
    Angle Field Doesn't Handle Touch Input Correctly (#2642)
    Color inputs are not filtered (security vulnerability for server-side blockly code evaluation) (#2637)
    Attaching Collapsed blocks to input containing existing block (#2632)
    Dropdown with long list does not scroll to selected item when re-opened (#2613)
    Procedures Don't Properly Handle Changing the Case of a Parameter (#2592)
    Procedures Don't Properly Handle Having No Name (#2591)
    Proposal: Wait to Set Field Value Until SourceBlock is Set (#2586)
    Insertion Marker Rendering Error (#2556)
    Document Move Options (#2524)
    Change Access Level of Field.updateWidth (#2428)
    Can't click "Done" on android phone keyboard (#2340)
    FieldAngle CLOCKWISE and OFFSET apply to all angle pickers simultaneously (#2315)
    Document Mutator's saveConnections (#2198)
    Node.js Tracking bug (#2082)
    New variable should default setter to that variable. (#2050)
    Comments not recorded in delete event (#1960)
    Remove goog library calls from generators/ files. (#1923)
    audio play() called before user interaction (#1902)
    image dropdown documentation improvement (#1750)
    Extract common Field support methods into new field_util.js (#1624)
    Document the process of creating a custom field. (#1623)
    RTL Render error on block with icon and no fields/inputs (#1608)
    Allow a block to restrict the maximum number of instances allowed in the workspace. (#1435)
    Function arguments: Disallow duplicate var names (#1377)
    Align first row of fields/inputs for connected blocks (#1346)
    FieldImage: Support "flip_rtl", like scratch-blocks (#1339)
    Make Closure dependency alert send devs to the link (#1313)
    Blockly.FieldNumber does not support HEX (#1306)
    Remove goog.dom.createDom(..) and .setProperties(..) usages (#1231)
    Block Factory tooltip and help url not escaping specific characters (#1192)
    Possible missing module.exports in compressed file (#955)
    Demo & docs for generated dropdown menu items in JSON + extension (#889)
    Use setText instead of setValue in fieldTextInput (#860)
    Block Factory injection vulnerability (#756)
    Pseudo version for npm (package.json) (#367)
    The play() request was interrupted by a call to pause() (#299)
    Can't configure field_colour in JSON (#286)
    Translate Github Wiki (#278)
    Dragging on touch IE (#254)
    add a new wiki page to showcase extensions blockly (#246)
    Highlight all possible connection places for a piece ! (#188)
    npm package name (#177)

Assets 2
Source code (zip)
Source code (tar.gz)

2.20190722.1
325adba

July 2019 - Node patch fix

@samelhusseini samelhusseini released this on Aug 5, 2019

This is a patch release for the July 2019 release.

It fixes the node build of Blockly and adds tests for node.

If you're not using Blockly with Node.js, this won't affect you.
Assets 2
Source code (zip)
Source code (tar.gz)

2.20190722.0
d471f51

July 2019

@rachel-fenichel rachel-fenichel released this on Jul 22, 2019

This release is our first major version bump. The next release will also be a major version bump, after which we should go back to regularly scheduled minor bumps.

If you're using Blockly plain, with no modifications, you shouldn't notice anything different. If you've made significant changes inside Blockly or are using our more advanced APIs, read on!
In this release (Q2 2019)

    A major cleanup of the Field APIs (huge thanks to Beka Westberg for this work, on both code and documentation)
        Existing library fields work the same
            And now we have documentation on all library fields, including code samples
        Your custom fields may need to be tweaked--see the Upgrading a Custom Field page
        We have documentation on creating a new custom field!
        Beka also built a custom field demo with annotated code samples

    Renames of a significant number of utility functions.
        For a full list of renamed functions, plus bash scripts to do most of the work for you, check out this gist
        This is part of our push to remove our dependency on the Closure UI library

    Deletion of the accessibility demo
        We're working on a new approach to accessibility, with a focus on keyboard navigation
        That is on the keyboard-nav branch, and will be in the Q3 release
        The old accessibility demo is now in a separate repo, blockly-experimental

    An XSD for validating Blockly XML files

    Assorted bug fixes

Here is a full list of pull requests and issues closed:
Issues closed

    Function argument names not escaped (#2624)
    Functions with return values have lost the no-statement option (#2621)
    Procedures with arguments break (#2620)
    Headless xml -> Javascript in Node.js: Many Problems (#2603)
    Previously partial XML parsing failure becomes absolute failure (#2600)
    run python build.py, but build failed (#2593)
    Procedures Don't Properly Handle Spaces (#2590)
    No longer builds on NodeJS v12+ (#2582)
    Headless Workspaces Require a Theme to Be Defined (#2575)
    Make separate Feature Request and Bug Report templates (#2566)
    Move accessible directory to an experiments repo (#2565)
    text_append block shows all variables in dropdown menu (#2561)
    Dynamic variable getter/setter toolbox error (#2557)
    hideChaff doesn't cancel chaff that's animating open (#2555)
    Blockly.getMainWorkspace returns WorkspaceSvg (#2553)
    Colour picker doesn't close on selection (#2544)
    Accessible Demo is broken (#2540)
    Shadow blocks sent to trash (#2538)
    Uncompressed Mode - Error using dynamics variables (#2536)
    Shadow blocks shouldn't hide blocklyPathDark (#2535)
    Date picker should fire change events (#2534)
    Code: add line numbers (#2533)
    Dropdown arrow missing padding. (#2527)
    Document Move Options (#2524)
    Why does the locally opened window have FieldDate, while the project launched with http://localhost:3000 has no FieldDate alone? (#2511)
    How to regenerate the blockly_compressed.js file after FieldDate unannotates it? (#2510)
    When the variable name can be displayed, the Chinese 姓名 can be displayed, and when it becomes code, is it name? (#2505)
    On the problem of recompiling errors after Uncommenting FildDate (#2504)
    Some Browsers Don't Properly Import XML with Sub-Block Nodes (#2499)
    Blockly.FieldDate is not a constructor (#2488)
    Make Adding Children to a Field's textElement_ Easier (#2484)
    Is there an object concept in Blockly? Or how to develop custom components for objects (#2481)
    How to Redevelop Field_date (#2480)
    Extension Documentation Example Incorrect (#2474)
    Audit fields' behavior when setting invalid values (#2462)
    Feature request: Collapse/expand blocks on double click (#2461)
    Q: Should fields initialize with default values? (#2454)
    Q: How do you want text input validation to look? (#2435)
    Blockly Future (#2432)
    Clarify in docs that variabletype needs to be set in Toolbox XML when using typed variables (#2422)
    what can i do to return the result from the function that use in controls_if block when i try to create a new block (actually i need it return true or false,but nothing return) (#2416)
    getAllBlockStyles Annotation Error? (#2414)
    MIT's licence appearing in compressed file (#2412)
    Buttons and Labels in Toolbox do Not Respect Elements (#2396)
    Comments should be allowed on non-movable/deletable blocks (#2388)
    Blocks Positioned Under Toolbox in RTL Demo (#2387)
    Calling setVisible(false) on a Field Does Not Update the Block Correctly (#2381)
    Angle picker needs border (#2379)
    Mouse clicks/drags are borked in Safari (#2362)
    [Android] Suggest to open number keyboard when edit number field (#2341)
    Documentation: Category XML Attributes (#2333)
    Update webdriverio to 5.4 (#2283)
    Remove enforced delays from generator tests (#2118)
    Update geckodriver to latest (#2117)
    Package name casing inconsistencies (#2102)
    Clicking on document should call Blockly.hideChaff (#2066)
    New variable should default setter to that variable. (#2050)
    XML namespace (#1978)
    Add Field.prototype.toXml() & .fromXml() (#1627)
    Use for field_number editor (#1595)
    Proposal - Block.setDisabled() to Block.setEnabled() (#1593)
    Create DTD for xml format (#1308)
    Remove uses of 'goog' in demos (#1072)
    Code demo is not escaping strings before colourizing them (#1002)
    BlocklyFactory: Remove dependency on closure. (#668)
    realtime not working playground.html (#88)

Pull requests

    Rebuild (#2643)
    Update dependencies (#2638)
    A bunch of XML related issues. (#2635)
    Remove edit handler that is just eating events (#2634)
    Add XSD to validate Blockly’s XML (#2633)
    Replace --dependency_mode=STRICT with PRUNE. (#2631)
    Added setCollapsed to insertion marker block creation. (#2629)
    Define DOMParser and Element in Blockly namespace (#2628)
    Fixed Procedure Argument Escaping (#2626)
    Remove accessibility demo from Blockly repo (#2623)
    Fixed Procedure Decomposition Not Working with >1 Arguments (#2622)
    Fixes bug with using dynamic variable in toolbox (#2618)
    Rename BlockAnimation > blockAnimation (#2617)
    Adds fill to svg dark path (#2611)
    Fixes spacing problem in procedure name (#2610)
    Update github templates (#2609)
    Create bug and feature templates (#2608)
    Adds type to FieldNumber editor (#2607)
    Rename Blockly.Xml.utils to Blockly.utils.xml (#2606)
    Fixes theme error for headless workspaces (#2605)
    Remove sudo tag in travis (#2602)
    Use Blockly.utils.Paths functions for some constants; fix a test (#2601)
    Rebase on develop (#2599)
    Fix IE not unhighlighting (#2598)
    Create svg_utils file (#2597)
    Rename block_render_* files (#2596)
    Added custom fields demo. (#2594)
    Build script updates (#2589)
    Removed Class Option Check from Text Input fromJson (#2588)
    Fixed Rendering of Images & Text Dropdown (#2587)
    Removed textToDom Needing Documents (#2585)
    upgrade gulp to v4 (#2583)
    Pull Request: Split showContextMenu_ (#2581)
    Fixed bug block is not unhighlighted (#2580)
    Fixed setTooltip Not Working Before appendField() (#2578)
    Added Sending the Bad Value to doValueInvalid (#2577)
    Added Procedure Tests (#2576)
    Remove last Closure from Block Factory. (#2573)
    Refactor workspace.connectionDBList (#2572)
    Resolve 13 warnings (#2571)
    Added Colour and Date Editor Auto-Close on Selection (#2570)
    Adds option for testing external and internal inputs (#2569)
    Added Trashcan Tests (#2568)
    Add a row after a dummy input. (#2567)
    Add simple page for comparing rendered blocks directly (#2564)
    Adds screenshot test script (#2563)
    Change alignment on previous and next connections (#2560)
    Fix regular expressions. (#2559)
    Fixed Fields Still Being Editable on Non-Editable Blocks (#2558)
    Render/bottom inline highlight (#2554)
    Remove a bunch more Closure (#2552)
    Fixed Field Disposal, and Reorganized Editor Creation (#2551)
    Clean up inline and external value input highlighting (#2550)
    Fix tree traversal to work for multiple stacks (#2549)
    Render/rtl top right (#2548)
    Extract connection placement into separate functions (#2547)
    Remove goog.color (#2546)
    Fixed how the Trashcan Handles Shadow Blocks (#2545)
    Add test case for stacked blocks (#2543)
    Add tests with external and inline inputs; set shadow colour (#2542)
    Account for shadow in block size. (#2541)
    Fix text y location on statement inputs (#2539)
    Block min width; notch offsets (#2537)
    Removed Extra DropDownDiv Calls (#2532)
    Add new test cases (#2529)
    Fixed Dropdown Arrow Missing Padding (#2528)
    Moved Serializing the Field's Name up to xml.js (#2526)
    Fix 19 warnings in theme-related code. (#2523)
    Adds minimum block height (#2522)
    Fix checkbox rendering (#2521)
    Call getSize in getCorrectedSize (#2520)
    Remove empty tests; clean up logs; open based on OS (#2519)
    Render insertion markers (#2518)
    Moved the Date Field to the Dropdown Div, and Restyled It (#2517)
    Draws highlight on the bottom of a statement input (#2516)
    Make tests pass by setting up requires/provides correctly (#2515)
    Set node version explicitly for travis on master (#2514)
    Adds alignment padding to dummy inputs (#2512)
    Reorganized Field View Initialization (#2509)
    Added getSourceBlock Function to Field (#2508)
    Readded Reevaluating Values when Constraints are Set (#2507)
    Replace Element constants with Node constants. (#2503)
    Angle Field Fixes (#2501)
    Fixed How Fields Handle Size (#2500)
    Added More setValue Test Coverage (#2498)
    Changed Colour Field Class Validator to Accept all Documented Values (#2497)
    Dependencies and tests (#2495)
    Fixes highlight for bottom row (#2494)
    Fix colour and image fields (#2492)
    More pixel pushing (#2491)
    Use constants for width and height of empty inline inputs. (#2489)
    Fix style matching in Firefox 67 (master cherrypick) (#2487)
    Restricts bottom row length after a statement input (#2486)
    Fix style matching in Firefox 67 (#2485)
    Make the test reporter function when tests pass (#2479)
    Refactors bottom row to be a row instead of measurable (#2478)
    Rendering tweaks (#2477)
    Handle empty filter argument, in an ugly way (#2476)
    Filter tests based on command line argument (#2475)
    Add single-block test cases (#2473)
    Refactor top row (#2472)
    Clear debug rectangles before rerendering (#2471)
    Add a checkbox to toggle rendering debug visualizations in the playground (#2470)
    Load a list of tests to run from a file; connect test output to dif-viewer (#2469)
    Fixes a dozen compiler warnings (#2468)
    Fix bug with in bounds bumping (#2467)
    Accessibility demo (#2466)
    Basic screenshot diffing (#2465)
    Prefix, suffix, window, global, requires, getViewportSize, oh my... (#2464)
    Fraser suffix2 (#2463)
    Moves navigation logic to cursor (#2460)
    Added Field Value Tests (#2459)
    Add STATEMENT_SUFFIX (#2458)
    Remove goog.userAgent dependency. (#2457)
    Maybe fix mocha tests (#2456)
    Use modify when inserting from the flyout (#2455)
    TDD: tests for navigation insert/modify, currently skipped (#2453)
    Changes the cursor look for a stack (#2452)
    Develop (#2450)
    Fixes case where we do not have a toolbox (#2449)
    Add wrapper functions so developers can override warning and error handling (#2448)
    Add basic tests for insert functions (#2447)
    Disconnect blocks with X (#2446)
    Make the marker blue on both blocks and input/output connections. (#2445)
    Mark the cursor location when opening the toolbox; cleanup (#2444)
    typo fix in createVariable documentation in variable.js (#2443)
    Small bug fixes and cleanup (#2442)
    Refactored Field Validation. (#2441)
    Get rid of insertionNode (#2439)
    Helper to check whether an ast node points to a connection (#2438)
    Handle escape in the toolbox/flyout. (#2437)
    Cleanup for previous (#2436)
    Run mocha tests in the browser on travis (#2434)
    Testing/webdriverio upgrade (#2433)
    Next cleanup (#2431)
    Reduce ID collisions. (#2429)
    Refactored field.init into field.initView and field.initModel (#2427)
    Add mocha tests to npm test (#2426)
    Removed Explicitly Setting Variable Type to Two Single Quotes (#2425)
    Update to webdriverio v5; fix resulting test breakages (#2424)
    Cleanup for in functionality (#2423)
    Out cleanup (#2421)
    Strip MIT’s licence out of compiled code. (#2420)
    Add a marker that shows where the user has marked on the workspace (#2419)
    Resolve field angle overlap render problem (#2418)
    Add a border to angle picker field, to fix rendering problem (#2417)
    Position correctly when inserting before another block (from the flyout) (#2415)
    Added updateColour to Field (#2413)
    Delete two unused i18n scripts (#2411)
    Fixed Buttons Being Rendered as Labels if They Come After a Label (#2410)
    Cursor ast update (#2409)
    Added fromXml and toXml to Fields (#2407)
    Removed setVisible (fields, inputs) from the Public API (#2406)
    Add tests for keyboard handling in the toolbox (#2405)
    Warnings fix (#2404)
    Set node version explicitly for travis; update dependencies (#2403)
    When moving from a stack to the workspace, place the cursor just above the recently selected stack. (#2402)
    Add release and milestone information to Readme (#2401)
    Update comment body size in resizeBubble (#2400)
    Added field_label_serializable (#2399)
    Kb exit toolbox (#2398)
    Moved RTL Demo Blocks so They Aren't Behind the Toolbox (#2397)
    Changed Buttons and Labels to Respect Elements in Toolbox (#2395)
    Update version number to 1.20190419.0-develop (#2394)
    Add sauce labs to readme (#2393)
    Validate newValue parameter in setValue (#2392)
    Keyboard nav ast node (#2391)
    Reorganize conditionals for block context menu (#2390)
    Added isSerializable and SERIALIZABLE to Field (#2389)
    Add Block.setEnabled (#2386)
    Added isDirty_ Property to Fields (#2382)
    #1142 Replace tests/generator/*.xml with .js (#2375)
    April 2019 release candidate (#2373)
    Documentation update (#2366)
    Change the cursor to a pointer if there is a click handler on the image (#1437)
    Add option to disable keyboard shortcuts (#171)
    Implement tree structure for blocks (#112)

Cherrypicks

    Fix colour injection vulnerability (#2645)
    Remove @packages annotation from public methods (#2653)
    Revert "Adds type to FieldNumber editor" (#2664)
    Rename Blockly.utils.Paths -> Blockly.utils.svgPath (#2658)
    Link to custom fields demo from demos/index.html (#2673)
    Revert changes related to #2003 (#2676)

Assets 2
Source code (zip)
Source code (tar.gz)

1.20190419.0
9c4f9d6

April 2019

@rachel-fenichel rachel-fenichel released this on Apr 19, 2019
Issues closed

    Small typo in field.js documentation (#2368)
    Menus change layout while moving highlight (#2351)
    Blockly math operators error (#2348)
    Trashcan's flyout badly positioned on X axis (#2345)
    Dropdown sizing issues (width and height) (#2337)
    Blocks unplugged during drag can be lost/deleted (#2336)
    Blockly.setTheme errors out if Blockly.getMainWorkspace() does not return a value (#2331)
    updateToolbox doesn't correctly remeasure the toolbox size (#2330)
    Dart math generator contains Python reference (#2329)
    Context Menus not Receiving Clicks (#2312)
    Scroll Event Bound in inject.js Doesn't Work for Multiple Workspaces (#2310)
    involuntary hatless mode (#2302)
    Add Constant for Scrolling with Non-Pixel Delta Modes (#2301)
    Recenter algorithm does not adapt to simple toolbox correctly (#2297)
    Message does not reference all 5 arg(s). (#2293)
    Multiple workspaces on the same page breaks when using trashcan (#2291)
    Bumping in RTL can push blocks unexpectedly far away (#2290)
    Q: Should the absoluteLeft and absoluteTop Metrics be Shifted to Avoid Simple Toolboxes? (#2280)
    Disable Next Blocks in Toolbox (#2273)
    Insertion marker flickering (#2255)
    Local build fails when run from top level (#2172)
    Test blocks should have common prefix (#2103)
    Clicking on document should call Blockly.hideChaff (#2066)
    make list from text block throws uncaught Error (#2061)
    New variable should default setter to that variable. (#2050)
    Custom Dialogs does not have an entry/icon in demos/index.html (#1709)
    FieldImage alt text does not propagate to page markup (#1632)
    Rename workspaceSvg.getFlyout_ to workspaceSvg.getFlyout (#1101)
    Underscore naming convention mismatch with jsdoc privacy annotations. (#695)

Pull requests

    Rebuild (#2372)
    typo fix in line 134 of field.js for documentation (#2371)
    typo fix in line 134 of field.js documentation (#2369)
    Updates function call (#2367)
    Common prefix for test blocks (#2361)
    Fixes bumping too much when in RTL (#2360)
    Hides chaff on document mouseup (#2359)
    Develop1709 (#2358)
    Rename WorkspaceSvg.getFlyout_ to WorkspaceSvg.getFlyout (#2357)
    Fix margins/checkbox in RTL dropdown menus (#2356)
    Adds check for a targetConnection (#2355)
    Update selected menu sizing to fix #2351 (#2353)
    Fix bubble open/close events (#2352)
    Ignores urls for eslint (#2350)
    Fixed Trashcan Flyout Positioning (#2349)
    Random upgrades (#2346)
    Fix zoom bug while dragging in Mutators (#2344)
    Remove Python references in Dart math generator (#2343)
    Set theme fix (#2335)
    Keyboard nav cleanup (#2334)
    Fixed updateToolbox Not Properly Updating Flyouts (#2332)
    Add a playgound for debugging SVG paths (#2328)
    Reverts changes to fix bug with selecting dropdown (#2327)
    Fix issue 2061 (make list from text block throws uncaught Error) (#2326)
    style -> categorystyle change (#2325)
    Don't try to bump if the object has already been deleted. (#2324)
    Fixed Scroll Event Binding to Work with Multiple Workspaces (#2323)
    Added Event Filtering to workspaceChanged in Mutator (#2320)
    Add click target property to fields, with accessor (#2318)
    Add dropdowndiv and use it for the colour picker and angle fields (#2313)

Assets 2
Source code (zip)
Source code (tar.gz)

1.20190215.0
82871b3

February 2019

@rachel-fenichel rachel-fenichel released this on Feb 15, 2019

Major features

    Insertion markers
    Large workspace performance
    Trashcan contents
    Theme API

Issues closed

    Insertion marker flickering (#2255)
    Multiple workspaces on the same page breaks when using trashcan (#2291)
    Disable Next Blocks in Toolbox (#2273)
    Complete adding Hausa language (ha) (#2264)
    getTertiaryColour -> getColourTertiary (#2262)
    request: Auto-generate Create buttons for added variable types (#2256)
    Should the "FinishedLoading" event be added to Events.fromJson? (#2250)
    Disabled blocks can't be retrieved from the trash. (#2239)
    Image dropdowns of disabled blocks don't render properly. (#2238)
    Trash hotspot wrong when trash is full. (#2237)
    workspace.getAllBlocks shouldn't return insertion markers by default (#2236)
    Shadow blocks are positioned wrong when converted to real blocks in DevTools (#2234)
    I can't get blockly working in Angular (#2232)
    Blocks disapper when a custom block connects with a defined block (#2231)
    feature request - Hide not so important "Inputs" (#2229)
    block.dispose(/healStack/ true) should not attempt to heal shadow block connections (#2227)
    Maximum Block Limit demo off by one (#2216)
    Colours on advanced compilation demos are all black (#2215)
    Exception "Cannot set property 'textContent' of undefined" from a custom block after blockly update (#2214)
    blockfactory error (#2206)
    No default jsDelivr CDN file set (#2200)
    store generated code safely on server (#2199)
    No Accessor to tell if BlocklyStorage has Anything Stored (#2197)
    Can Blockly use upload file button? (#2194)
    Document maxTrashcanContents Option (#2192)
    Undeletable Blocks Created Through .domToWorkspace can be "Deleted" through Undo (#2191)
    Display Trashcan Flyout Horizontally when Layout is Horizontal (#2166)
    uncheckedconversions compilation error: Fix in progress (#2164)
    text_join argument precedence bug in PHP (#2161)
    flyout_base's .filterForCapacity Does Not Consider Children When Checking .remainingCapacityOfType (#2154)
    Document Max Instances Option (#2141)
    Trashcan Contents (#2136)

Pull requests

    Rebuild 02 11 19 (#2288)
    Update dependencies (#2284)
    Fixed Horizontal Scrolling on Window Resize for Simple Toolboxes (#2282)
    Fixed Flyout Scrollbars Not Being Repositioned on Window Resize (#2281)
    Fixed next blocks not being disabled in flyout. (#2278)
    Check against healing child shadow blocks (#2271)
    Changes colour names (#2270)
    Typo fix in code comment (#2269)
    Pull in pxt-blockly's rendering file and hack until blocks can be created without errors (#2266)
    Typo in code comment (#2265)
    Update to latest Closure Template jars, recompile. (#2263)
    Rebase rendering branch on develop (#2260)
    Fix event description for theme (#2259)
    Speed up the connection DB (#2254)
    Added a Test Block for a Dynamic Dropdown (#2252)
    Update procedures.js (#2251)
    Update procedures.js (#2248)
    Fixed Image Dropdowns on Disabled Blocks not Rendering Correctly. (#2246)
    Ignore insertion markers in getAllBlocks; add accessors for insertion markers (#2243)
    Changed Trashcan Lid Opening Direction (#2242)
    Retrieve Disabled Blocks from the Trashcan (#2241)
    Fixed Trashcan Hotspot & Changed Positioning (#2240)
    Added FinishedLoading Event (#2235)
    Ignore insertion markers when checking remaining capacity (#2233)
    Access colours using bracket notation (#2226)
    Block in (#2225)
    Add support for rendering a vertical input based cursor (#2224)
    Show the cursor with attached to a statement connection (#2223)
    Block nav (#2222)
    Initial cursor rendering, supports coordinate positioning only (#2221)

Assets 2
Source code (zip)
Source code (tar.gz)

1.20181219.0
817399a

December 2018

@rachel-fenichel rachel-fenichel released this on Dec 19, 2018
Issues closed

    Blockly not compiling totally when using build.py (#2138)
    IO loop going away before the audio device has been stopped (#2134)
    FieldImage opt_onClick initialisation when the block is defined in json (#2132)
    C shaped blocks don't wrap around other blocks (insertion markers, develop) (#2131)
    Mobile Demos scale is off and user can zoom page (#2119)
    Update selenium to latest (#2116)
    Upgrade chromedriver to latest (#2115)
    Upgrade build.py to python 3 (#2112)
    broken when rename arguments of function (#2110)
    getVariable can fail (#2107)
    how to build blocks_compressed.js? (#2099)
    Undo broken when deleting multiple blocks in a stack (#2097)
    Serializing a stack of blocks only outputs the first block (#2096)
    logic_boolean block can not be dragged from toolbox on Android (#2055)
    BlockFactory is broken (#2040)
    controls_if: Mutation actions do not undo correctly (#2037)
    Calling setTooltip on a field label or image during Block.init() crashes (#2030)
    Add randomness to bump distances (#2011)
    Upgrade to Dart 2.0 (#1951)
    Deleting workspace comments sometimes throws console warnings (#1848)
    Dragging a block off the edge breaks undo in fixed size workspaces (#1653)
    Renaming a procedure does not group events (#1508)
    Replace goog.asserts when validating user data (#824)
    [Edge, IE] Zoom control mouseover is not clipped (#172)

Pull requests

    Disable insertion markers for the December 2018 release (#2170)
    Groups events fired during field input change (#2168)
    Reconnects child blocks when an undo is done on an else block (#2167)
    Propagate the event group when enforcing bounds on blocks (#2163)
    Handle promise rejection for sound.play() in preload (#2162)
    #172, Fixed [Edge, IE] Zoom control mouseover is not clipped (#2159)
    Fixed Filter Capacity not Considering Child Blocks. (#2155)
    #1848 Fixed throw console warning when deleting workspace comments (#2151)
    Tweak insertion marker snap radii (#2149)
    Added randomness to bumping per Issue #2011 (#2148)
    Allow statement connections to connect around block stacks during drags (#2147)
    Pulls from MakeCode fork the ability to rename and delete variables i… (#2144)
    Bugfix/2107 (#2139)
    Generate Code For Single Block (#2133)
    Added Max Instances Property to Workspace Options (#2130)
    Rebase insertion markers into the rendering branch (#2129)
    Feature/insertion markers (#2127)
    Update selenium version (#2126)
    Fix issues related to Python 3 compatibility (#2125)
    Update chromedriver version (#2124)
    Make build.py compatible with Python 2 and 3 (#2123)
    Add support for handling window.prompt(..) etc in iOS mobile demo (#2121)
    Removing comment around (#2120)
    [rendering] update build script (#2113)
    Run generator tests on Travis (#2111)
    fix #2090 (#2109)
    Rebuild to include blockToDom fix; bump version number (#2106)
    Immovable blocks should not move when workspace is cleaned (#2104)

Assets 2
Source code (zip)
Source code (tar.gz)

1.20181105.0
d3a7324

November 2018 patch

@rachel-fenichel rachel-fenichel released this on Nov 5, 2018

This release contains all of the changes from the October 2018 release, plus a rebuild to apply those changes to the compressed files.
Assets 2
Source code (zip)
Source code (tar.gz)

1.20181030.0
09853c3

October 2018

@rachel-fenichel rachel-fenichel released this on Nov 1, 2018
The compressed files are out of date in this release. Please use the November patch release instead.

Bugs closed in this release (not all bugs were present on master):

    Blocks unable to be dragged or fields edited (#2089)
    Pull vs Downloading .zip (#2075)
    Typed variables do not appear in the toolbox (#2071)
    mathRandomInt problem (#2070)
    Add connection.getChecks function (#2048)
    field_image opt_onClick not work (#2034)
    Remove goog library calls from blocks/ files. (#1922)
    Image field: click handler gets ignored (#1887)
    Combine code for CommentDelete.run and CommentCreate.run (#1871)
    Disallow block type names that might match anything in Blockly.Generator.prototype (#1558)
    Audit all uses of goog.dom.createDom (#1423)
    Move block animations to a separate file (#1022)
    Serializing a stack of blocks only outputs the first block (#2096)

Release notes:

    Generator test improvements (#2085)
    Fix setting tooltips in field init for fields (#2084)
    Fix setting tooltips in field init for label fields (#2083)
    Upgrade to dart 2.0 (#2081)
    Remove all calls to goog.dom.createDom (#2080)
    Add new atan2 block (#2079)
    Honour reductions to MAX_UNDO (#2078)
    Adding hooks for Android dialogs upon console.prompt() and similar (#2077)
    Updating Android ContraintLayout (#2074)
    Update Android project to gradle 3.2.0 (#2073)
    Update gradle to 3.1.4 (#2072)
    Fix inconsistent return type warning (#2069)
    Remove unneeded String() and str() calls. (#2068)
    Optimized Images by the GitHub [ImgBot] (61.18kb -> 44.41kb (27.42%)) (#2065)
    Optimized Images by the GitHub [ImgBot] (61.18kb -> 44.41kb (27.42%)) (#2064)
    Playground upgrades (#2063)
    Remove .children access (#2059)
    Adding demos/mobile/README.md (#2058)
    Adding mobile HTML demo (#2057)
    Android/iOS demos (#2056)
    Moving all mobile demos into demos/mobile. (#2054)
    Restructure isConnectionAllowed to match scratch blocks (#2053)
    Calls to getAllBlocks should pass a value for ordered (#2052)
    Add some functions for insertion markers (#2051)
    Add connection.getCheck function #2048 (#2049)
    Mark some field properties protected (#2047)
    fix #1887 #2034 (#2046)
    fix bug.when create get/set dynamic variable block from set/get , lost the type. (#2045)
    Merge Sept patch release (PR #2042) into develop (#2044)
    Bumping develop branch version to 1.20180904.0-develop (#2043)
    Fix bad xml element when generating next node (#2100)

Assets 2
Source code (zip)
Source code (tar.gz)

1.20180904
1d9fad0

September 2018 patch release

@rachel-fenichel rachel-fenichel released this on Oct 17, 2018

This release is associated with PR #2042.

This is a minor change from the August 2018 release.
Assets 2
Source code (zip)
Source code (tar.gz)

1.20180831.0
ad27d6d

August 2018 release

@rachel-fenichel rachel-fenichel released this on Oct 17, 2018

This release is associated with PR #2027
Assets 2
Source code (zip)
Source code (tar.gz)
