#include "stdafx.h"
#include "ProjectFrame.h"
#include "ExtensionFrame.h"
#include "OSLayer.h"
#include "Messages.h"
#include "ProjectDirDialog.h"
#include "NewDialogs.h"
#include "Dialogs.h"
#include "Build.h"

#include "TabDoc.h"
#include "TabExtensions.h"
#include "TabIndex.h"
#include "TabResults.h"
#include "TabSkein.h"
#include "TabStory.h"
#include "TabTranscript.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#define MAX_MENU_EXTENSIONS 1000

IMPLEMENT_DYNAMIC(ProjectFrame, MenuBarFrameWnd)

BEGIN_MESSAGE_MAP(ProjectFrame, MenuBarFrameWnd)
  ON_WM_CREATE()
  ON_WM_DESTROY()
  ON_WM_ACTIVATE()
  ON_WM_CLOSE()
  ON_WM_SIZE()
  ON_WM_SETCURSOR()
  ON_WM_MEASUREITEM()
  ON_WM_DRAWITEM()
  ON_WM_SETTINGCHANGE()
  ON_MESSAGE(WM_SETMESSAGESTRING, OnSetMessageString)

  ON_MESSAGE(WM_PLAYSKEIN, OnPlaySkein)
  ON_MESSAGE(WM_GAMERUNNING, OnGameRunning)
  ON_MESSAGE(WM_GAMEWAITING, OnGameWaiting)
  ON_MESSAGE(WM_PANEHEADING, OnPaneHeading)
  ON_MESSAGE(WM_SELECTSIDE, OnSelectSide)
  ON_MESSAGE(WM_SELECTVIEW, OnSelectView)
  ON_MESSAGE(WM_PASTECODE, OnPasteCode)
  ON_MESSAGE(WM_RUNTIMEPROB, OnRuntimeProblem)
  ON_MESSAGE(WM_SEARCHSOURCE, OnSearchSource)
  ON_MESSAGE(WM_SEARCHDOC, OnSearchDoc)
  ON_MESSAGE(WM_SHOWTRANSCRIPT, OnShowTranscript)
  ON_MESSAGE(WM_SHOWSKEIN, OnShowSkein)
  ON_MESSAGE(WM_TERPFAILED, OnTerpFailed)
  ON_MESSAGE(WM_PROJECTDIR, OnProjectDir)
  ON_MESSAGE(WM_TRANSCRIPTEND, OnTranscriptEnd)
  ON_MESSAGE(WM_PLAYNEXTTHREAD, OnPlayNextThread)
  ON_MESSAGE(WM_CANPLAYALL, OnCanPlayAll)
  ON_MESSAGE(WM_PROJECTEDITED, OnProjectEdited)
  ON_MESSAGE(WM_EXTDOWNLOAD, OnExtDownload)
  ON_MESSAGE(WM_PROGRESS, OnProgress)

  ON_COMMAND(ID_FILE_NEW, OnFileNew)
  ON_COMMAND(ID_FILE_OPEN, OnFileOpen)
  ON_COMMAND(ID_FILE_INSTALL_EXT, OnFileInstallExt)
  ON_COMMAND(ID_FILE_NEW_EXT, OnFileNewExt)
  ON_COMMAND_RANGE(ID_EXTENSIONS_LIST, ID_EXTENSIONS_LIST+MAX_MENU_EXTENSIONS-1, OnFileOpenExt)
  ON_UPDATE_COMMAND_UI(ID_FILE_CLOSE, OnUpdateCompile)
  ON_COMMAND(ID_FILE_CLOSE, OnFileClose)
  ON_UPDATE_COMMAND_UI(ID_FILE_SAVE, OnUpdateCompile)
  ON_COMMAND(ID_FILE_SAVE, OnFileSave)
  ON_UPDATE_COMMAND_UI(ID_FILE_SAVE_AS, OnUpdateCompile)
  ON_COMMAND(ID_FILE_SAVE_AS, OnFileSaveAs)
  ON_COMMAND(ID_FILE_IMPORT_SKEIN, OnFileImportSkein)

  ON_UPDATE_COMMAND_UI(ID_FORMAT_ELASTIC_TABSTOPS, OnUpdateElasticTabStops)
  ON_COMMAND(ID_FORMAT_ELASTIC_TABSTOPS, OnFormatElasticTabStops)

  ON_UPDATE_COMMAND_UI(ID_PLAY_GO, OnUpdateCompile)
  ON_COMMAND(ID_PLAY_GO, OnPlayGo)
  ON_UPDATE_COMMAND_UI(ID_PLAY_TEST, OnUpdateCompile)
  ON_COMMAND(ID_PLAY_TEST, OnPlayTest)
  ON_UPDATE_COMMAND_UI(ID_PLAY_STOP, OnUpdatePlayStop)
  ON_COMMAND(ID_PLAY_STOP, OnPlayStop)
  ON_UPDATE_COMMAND_UI(ID_PLAY_REFRESH, OnUpdateCompile)
  ON_COMMAND(ID_PLAY_REFRESH, OnPlayRefresh)
  ON_COMMAND(ID_PLAY_LOAD, OnPlayLoad)

  ON_UPDATE_COMMAND_UI(ID_REPLAY_LAST, OnUpdateCompile)
  ON_COMMAND(ID_REPLAY_LAST, OnReplayLast)
  ON_UPDATE_COMMAND_UI(ID_REPLAY_BLESSED, OnUpdateReplayBlessed)
  ON_COMMAND(ID_REPLAY_BLESSED, OnReplayBlessed)
  ON_COMMAND(ID_REPLAY_SHOW_LAST, OnReplayShowLast)
  ON_COMMAND(ID_REPLAY_SHOW_LAST_SKEIN, OnReplayShowLastSkein)
  ON_UPDATE_COMMAND_UI_RANGE(ID_REPLAY_CHANGED_PREV, ID_REPLAY_CHANGED_NEXT, OnUpdateReplayChanged)
  ON_COMMAND_RANGE(ID_REPLAY_CHANGED_PREV, ID_REPLAY_CHANGED_NEXT, OnReplayChanged)
  ON_UPDATE_COMMAND_UI_RANGE(ID_REPLAY_DIFF_PREV, ID_REPLAY_DIFF_NEXT, OnUpdateReplayDiffer)
  ON_COMMAND_RANGE(ID_REPLAY_DIFF_PREV, ID_REPLAY_DIFF_NEXT, OnReplayDiffer)
  ON_UPDATE_COMMAND_UI(ID_REPLAY_DIFF_NEXT_SKEIN, OnUpdateReplayDifferSkein)
  ON_COMMAND(ID_REPLAY_DIFF_NEXT_SKEIN, OnReplayDifferSkein)

  ON_UPDATE_COMMAND_UI_RANGE(ID_RELEASE_GAME, ID_RELEASE_TEST, OnUpdateReleaseGame)
  ON_COMMAND_RANGE(ID_RELEASE_GAME, ID_RELEASE_TEST, OnReleaseGame)
  ON_COMMAND(ID_RELEASE_MATERIALS, OnReleaseMaterials)
  ON_UPDATE_COMMAND_UI(ID_RELEASE_IFICTION, OnUpdateCompile)
  ON_COMMAND(ID_RELEASE_IFICTION, OnReleaseIFiction)

  ON_COMMAND(ID_WINDOW_LEFTPANE, OnWindowLeftPane)
  ON_COMMAND(ID_WINDOW_RIGHTPANE, OnWindowRightPane)
  ON_COMMAND(ID_WINDOW_SWITCH, OnWindowSwitchPanes)
  ON_COMMAND_RANGE(ID_WINDOW_TAB_SOURCE, ID_WINDOW_TAB_SOURCE+8, OnWindowShowTab)
  ON_COMMAND_RANGE(ID_WINDOW_INDEX_CONTENTS, ID_WINDOW_INDEX_CONTENTS+6, OnWindowShowIndex)
  ON_UPDATE_COMMAND_UI(ID_WINDOW_LIST, OnUpdateWindowList)
  ON_COMMAND_RANGE(ID_WINDOW_LIST, ID_WINDOW_LIST+8, OnWindowList)

  ON_COMMAND(ID_HELP_INDEX, OnHelpIndex)
  ON_COMMAND(ID_HELP_EXTENSIONS, OnHelpExtensions)
  ON_COMMAND(ID_HELP_RECIPES, OnHelpRecipes)
  ON_COMMAND(ID_HELP_LICENCE, OnHelpLicence)
  ON_COMMAND(ID_HELP_WINDOWS, OnHelpWindows)

  ON_COMMAND(ID_SEARCH_SOURCE, OnSearchSource)
  ON_COMMAND(ID_SEARCH_DOCS, OnSearchDocs)
END_MESSAGE_MAP()

static UINT indicators[] =
{
  ID_SEPARATOR,
  ID_INDICATOR_CAPS,
  ID_INDICATOR_NUM,
};

ProjectFrame::ProjectFrame()
  : m_busy(false), m_I6debug(false), m_game(m_skein), m_focus(0),
    m_loadFilter(1), m_menuGutter(0), m_menuTextGap(0,0)
{
}

int ProjectFrame::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
  if (MenuBarFrameWnd::OnCreate(lpCreateStruct) == -1)
    return -1;

  // Create a splitter to occupy the client area of the frame
  if (!m_splitter.CreateStatic(this,1,2))
  {
    TRACE("Failed to create splitter window\n");
    return -1;
  }

  for (int i = 0; i < 2; i++)
  {
    if (!m_splitter.CreateView(0,i,RUNTIME_CLASS(Panel),CSize(0,0),NULL))
    {
      TRACE("Failed to create panel window\n");
      return -1;
    }
  }

  CRect client;
  GetClientRect(client);
  int width = (client.Width()/2)-6;
  m_splitter.SetColumnInfo(0,width,16);
  m_splitter.SetColumnInfo(1,width,16);

  // Set the initial tabs
  GetPanel(1)->SetActiveTab(Panel::Tab_Doc);
  ((TabDoc*)GetPanel(1)->GetTab(Panel::Tab_Doc))->SetFocusFlag(false);
  GetPanel(0)->SetActiveTab(Panel::Tab_Source);

  // Listen for notifications from the tabs
  ((TabResults*)GetPanel(0)->GetTab(Panel::Tab_Results))->SetLinkNotify(this);
  ((TabResults*)GetPanel(1)->GetTab(Panel::Tab_Results))->SetLinkNotify(this);
  ((TabIndex*)GetPanel(0)->GetTab(Panel::Tab_Index))->SetLinkNotify(this);
  ((TabIndex*)GetPanel(1)->GetTab(Panel::Tab_Index))->SetLinkNotify(this);
  ((TabExtensions*)GetPanel(0)->GetTab(Panel::Tab_Extensions))->SetLinkNotify(this);
  ((TabExtensions*)GetPanel(1)->GetTab(Panel::Tab_Extensions))->SetLinkNotify(this);
  ((TabSettings*)GetPanel(0)->GetTab(Panel::Tab_Settings))->SetNotify(this);
  ((TabSettings*)GetPanel(1)->GetTab(Panel::Tab_Settings))->SetNotify(this);

  // Set up the source tabs
  ((TabSource*)GetPanel(1)->GetTab(Panel::Tab_Source))->SetDocument(
    ((TabSource*)GetPanel(0)->GetTab(Panel::Tab_Source)));

  // Set up the story tabs
  ((TabStory*)GetPanel(0)->GetTab(Panel::Tab_Story))->SetGame(&m_game);
  ((TabStory*)GetPanel(1)->GetTab(Panel::Tab_Story))->SetGame(&m_game);

  // Set up the skein tabs
  ((TabSkein*)GetPanel(0)->GetTab(Panel::Tab_Skein))->SetSkein(&m_skein);
  ((TabSkein*)GetPanel(1)->GetTab(Panel::Tab_Skein))->SetSkein(&m_skein);

  // Set up the transcript tabs
  ((TabTranscript*)GetPanel(0)->GetTab(Panel::Tab_Transcript))->SetSkein(&m_skein);
  ((TabTranscript*)GetPanel(1)->GetTab(Panel::Tab_Transcript))->SetSkein(&m_skein);

  // Set up the settings tabs
  ((TabSettings*)GetPanel(0)->GetTab(Panel::Tab_Settings))->SetSettings(&m_settings);
  ((TabSettings*)GetPanel(1)->GetTab(Panel::Tab_Settings))->SetSettings(&m_settings);

  // Create the game window
  m_game.Create(this);

  // Create the toolbars
  DWORD style = WS_CHILD|WS_VISIBLE|CBRS_ALIGN_TOP|CBRS_TOOLTIPS|CBRS_FLYBY;
  DWORD ctrlStyle = TBSTYLE_FLAT|TBSTYLE_TRANSPARENT;
  if (theOS.GetDllVersion("comctl32.dll") >= DLLVERSION(5,81)) // comctrl32 5.81 or higher
    ctrlStyle |= TBSTYLE_LIST;
  if (!m_toolBar.CreateEx(this,ctrlStyle,style) || !LoadToolBar())
  {
    TRACE("Failed to create main toolbar\n");
    return -1;
  }
  if (!m_helpBar.CreateEx(this,ctrlStyle,style) || !LoadHelpBar())
  {
    TRACE("Failed to create help toolbar\n");
    return -1;
  }
  style = CBRS_ALIGN_TOP|CBRS_TOOLTIPS|CBRS_FLYBY;
  if (!m_searchBar.Create(this,style,AFX_IDW_DIALOGBAR))
  {
    TRACE("Failed to create search toolbar\n");
    return -1;
  }

  // Create the menu bar and add the toolbars to it
  if (!CreateMenuBar(IDR_MAINFRAME,0))
  {
    TRACE("Failed to create menu bar\n");
    return -1;
  }
  if (!m_coolBar.AddBar(&m_toolBar,NULL,NULL,RBBS_NOGRIPPER|RBBS_BREAK) ||
      !m_coolBar.AddBar(&m_searchBar,NULL,NULL,RBBS_NOGRIPPER) ||
      !m_coolBar.AddBar(&m_helpBar,NULL,NULL,RBBS_NOGRIPPER))
  {
    TRACE("Failed to add toolbars\n");
    return -1;
  }

  // Create the status bar
  if (!m_statusBar.Create(this) ||
      !m_statusBar.SetIndicators(indicators,sizeof(indicators)/sizeof(UINT)))
  {
    TRACE("Failed to create status bar\n");
    return -1;
  }

  // Create an invisible progress control for the status bar
  if (!m_progress.Create(WS_CHILD,CRect(0,0,0,0),&m_statusBar,IDC_PROGRESS))
  {
    TRACE("Failed to create progress control\n");
    return -1;
  }

  // Create the search results window
  if (!m_search.Create(this))
  {
    TRACE("Failed to create search results window\n");
    return -1;
  }

  // Set the application icon
  theApp.SetIcon(this);

  // Create the menu of available extensions
  UpdateMenuParams();
  UpdateExtensionsMenu();

  if (getenv("INFORM7_TEST") == NULL)
  {
    // Remove test menu item
    GetMenu()->RemoveMenu(ID_PLAY_LOAD,MF_BYCOMMAND);
  }

  return 0;
}

BOOL ProjectFrame::PreCreateWindow(CREATESTRUCT& cs)
{
  if (!MenuBarFrameWnd::PreCreateWindow(cs))
    return FALSE;

  cs.dwExStyle &= ~WS_EX_CLIENTEDGE;
  cs.lpszClass = AfxRegisterWndClass(0);
  return TRUE;
}

void ProjectFrame::OnActivate(UINT nState, CWnd* pWndOther, BOOL bMinimized)
{
  MenuBarFrameWnd::OnActivate(nState,pWndOther,bMinimized);

  switch (nState)
  {
  case WA_INACTIVE:
    // Store the focus window
    m_focus = GetFocus()->GetSafeHwnd();
    break;
  case WA_ACTIVE:
    // Check if the source file has been changed by another application
    TabSource* leftSource = (TabSource*)GetPanel(0)->GetTab(Panel::Tab_Source);
    if (leftSource->CheckNeedReopen(m_projectDir))
    {
      // Reopen the source files
      leftSource->OpenProject(m_projectDir,true);
      GetPanel(1)->GetTab(Panel::Tab_Source)->OpenProject(m_projectDir,false);

      // Update elastic tabstops, if in use
      ((TabSource*)GetPanel(0)->GetTab(Panel::Tab_Source))->SetElasticTabStops(m_settings.m_elasticTabStops);
    }

    // Restore the focus window
    if (!::IsWindow(m_focus))
      m_focus = 0;
    if (m_focus != 0)
      CWnd::FromHandle(m_focus)->SetFocus();
    break;
  }
}

void ProjectFrame::OnDestroy()
{
  m_game.StopInterpreter(false);
  SaveSettings();
  MenuBarFrameWnd::OnDestroy();
}

void ProjectFrame::OnClose()
{
  if (IsProjectEdited())
  {
    // Ask the user before discarding the project
    CString msg;
    msg.Format(
      "Closing %s will discard any changes.\n"
      "Do you want to save this project first?",(LPCSTR)GetDisplayName(false));
    switch (MessageBox(msg,INFORM_TITLE,MB_YESNOCANCEL|MB_ICONEXCLAMATION))
    {
    case IDYES:
      {
        // Try to save the project. If this fails, prompt the user for a directory
        bool saved = SaveProject(m_projectDir);
        while (saved == false)
        {
          ProjectDirDialog dialog(false,m_projectDir,"Save the project",this);
          if (dialog.ShowDialog() == IDOK)
            saved = SaveProject(dialog.GetProjectDir());
          else
            saved = true;
        }
      }
      break;
    case IDNO:
      // Do nothing
      break;
    case IDCANCEL:
      // Don't close the window
      return;
    }
  }

  m_game.StopInterpreter(false);
  CleanProject();

  // If there are any secondary frame windows and this is the main frame,
  // promote one of the secondaries to be the new main frame.
  theApp.FrameClosing(this);
  MenuBarFrameWnd::OnClose();
}

void ProjectFrame::OnSize(UINT nType, int cx, int cy)
{
  MenuBarFrameWnd::OnSize(nType,cx,cy);

  // Reposition and update the toolbars
  if (m_coolBar.GetSafeHwnd() != 0)
  {
    m_coolBar.GetReBarCtrl().MinimizeBand(2);
    m_toolBar.Invalidate();
    m_searchBar.Invalidate();
    m_helpBar.Invalidate();
  }
}

BOOL ProjectFrame::OnSetCursor(CWnd* pWnd, UINT nHitTest, UINT message)
{
  if (theApp.IsWaitCursor())
  {
    theApp.RestoreWaitCursor();
    return TRUE;
  }
  return MenuBarFrameWnd::OnSetCursor(pWnd,nHitTest,message);
}

void ProjectFrame::OnMeasureItem(int nIDCtl, LPMEASUREITEMSTRUCT mi)
{
  if (mi->CtlType == ODT_MENU)
  {
    // Custom measurement for extensions menu items
    if ((mi->itemID >= ID_EXTENSIONS_LIST) && (mi->itemID < ID_EXTENSIONS_LIST+MAX_MENU_EXTENSIONS))
    {
      InformApp::ExtLocation* ext = (InformApp::ExtLocation*)mi->itemData;

      // Get the size of the menu text
      CDC* dc = GetDC();
      CFont* oldFont = dc->SelectObject(&m_menuFonts[ext->system ? 1 : 0]);
      CSize sz = dc->GetTextExtent(CString(ext->title.c_str()));
      dc->SelectObject(oldFont);
      ReleaseDC(dc);

      // Add space around the text
      sz.cx += m_menuGutter+(2*m_menuTextGap.cx);
      sz.cy += 2*m_menuTextGap.cy;

      mi->itemWidth = sz.cx;
      mi->itemHeight = sz.cy;
      return;
    }
  }
  CWnd::OnMeasureItem(nIDCtl,mi);
}

void ProjectFrame::OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT di)
{
  if (di->CtlType == ODT_MENU)
  {
    // Custom drawing for extensions menu items
    if ((di->itemID >= ID_EXTENSIONS_LIST) && (di->itemID < ID_EXTENSIONS_LIST+MAX_MENU_EXTENSIONS))
    {
      CRect rc(di->rcItem);
      InformApp::ExtLocation* ext = (InformApp::ExtLocation*)di->itemData;

      // Get the theme, if any
      HTHEME theme = 0;
      if (theOS.IsAppThemed())
        theme = theOS.OpenThemeData(this,L"MENU");

      if (theme != 0)
      {
        // Get a device context for buffered painting
        HANDLE pb = 0;
        CDC* dc = theOS.BeginBufferedPaint(di->hDC,&(di->rcItem),BPBF_COMPATIBLEBITMAP,&pb);

        // Draw the menu background
        theOS.DrawThemeBackground(theme,dc,9/*MENU_POPUPBACKGROUND*/,0,&rc);

        // Draw the menu gutter
        rc.right = di->rcItem.left+m_menuGutter;
        theOS.DrawThemeBackground(theme,dc,13/*MENU_POPUPGUTTER*/,0,&rc);

        // Draw the menu item
        int state = (di->itemState & ODS_SELECTED) ? 2/*MPI_HOT*/ : 1/*MPI_NORMAL*/;
        rc.left = di->rcItem.left;
        rc.right = di->rcItem.right;
        theOS.DrawThemeBackground(theme,dc,14/*MENU_POPUPITEM*/,state,&rc);

        // Select a colour for the menu text, based on the theme's colours
        if (ext->system)
        {
          dc->SetTextColor(theApp.BlendedColour(
            theOS.GetThemeColor(theme,14,state,TMT_TEXTCOLOR),4,
            theOS.GetThemeColor(theme,9,0,TMT_FILLCOLORHINT),1));
        }
        else
          dc->SetTextColor(theOS.GetThemeColor(theme,14,state,TMT_TEXTCOLOR));

        // Draw the menu text
        rc.left = di->rcItem.left+m_menuGutter+m_menuTextGap.cx;
        CFont* oldFont = dc->SelectObject(&m_menuFonts[ext->system ? 1 : 0]);
        dc->SetBkMode(TRANSPARENT);
        dc->DrawText(CString(ext->title.c_str()),rc,DT_VCENTER|DT_SINGLELINE);
        dc->SelectObject(oldFont);

        theOS.EndBufferedPaint(pb,TRUE);
        theOS.CloseThemeData(theme);
      }
      else
      {
        CDC* dc = CDC::FromHandle(di->hDC);

        if (di->itemState & ODS_SELECTED)
        {
          dc->SetTextColor(::GetSysColor(COLOR_HIGHLIGHTTEXT));
          dc->SetBkColor(::GetSysColor(COLOR_HIGHLIGHT));
        }
        else
        {
          if (ext->system)
          {
            dc->SetTextColor(theApp.BlendedColour(
              ::GetSysColor(COLOR_MENUTEXT),4,::GetSysColor(COLOR_MENU),1));
          }
          else
            dc->SetTextColor(::GetSysColor(COLOR_MENUTEXT));
          dc->SetBkColor(::GetSysColor(COLOR_MENU));
        }

        dc->ExtTextOut(0,0,ETO_OPAQUE,rc,NULL,0,NULL);
        rc.left = di->rcItem.left+m_menuGutter+m_menuTextGap.cx;
        CFont* oldFont = dc->SelectObject(&m_menuFonts[ext->system ? 1 : 0]);
        dc->DrawText(CString(ext->title.c_str()),rc,DT_VCENTER|DT_SINGLELINE);
        dc->SelectObject(oldFont);
      }
      return;
    }
  }
  CWnd::OnDrawItem(nIDCtl,di);
}

void ProjectFrame::OnSettingChange(UINT uFlags, LPCTSTR lpszSection)
{
  UpdateMenuParams();
}

LRESULT ProjectFrame::OnSetMessageString(WPARAM wParam, LPARAM lParam)
{
  if ((wParam == AFX_IDS_IDLEMESSAGE) && (lParam == NULL))
  {
    static CString msg;
    if (msg.IsEmpty())
      msg.Format(AFX_IDS_IDLEMESSAGE,NI_BUILD);
    return MenuBarFrameWnd::OnSetMessageString(0,(LPARAM)(LPCSTR)msg);
  }
  return MenuBarFrameWnd::OnSetMessageString(wParam,lParam);
}

BOOL ProjectFrame::OnCmdMsg(UINT nID, int nCode, void* pExtra, AFX_CMDHANDLERINFO* pHandlerInfo)
{
  CPushRoutingFrame push(this);
  CWnd* focusWnd = GetFocus();

  // Let the interpreter window process the command first
  if (m_game.IsChild(focusWnd))
  {
    if (m_game.OnCmdMsg(nID,nCode,pExtra,pHandlerInfo))
      return TRUE;

    // If the interpreter did not process the command,
    // make sure it is routed to the correct panel
    for (int i = 0; i < 2; i++)
    {
      if (((TabStory*)GetPanel(i)->GetTab(Panel::Tab_Story))->IsActive())
      {
        if (GetPanel(i)->OnCmdMsg(nID,nCode,pExtra,pHandlerInfo))
          return TRUE;
      }
    }
  }

  // Then let the panels process the command
  for (int i = 0; i < 2; i++)
  {
    if (GetPanel(i)->IsChild(focusWnd))
    {
      if (GetPanel(i)->OnCmdMsg(nID,nCode,pExtra,pHandlerInfo))
        return TRUE;
    }
  }

  // Then try the search bar
  if ((m_searchBar.GetSafeHwnd() != 0) && m_searchBar.IsChild(focusWnd))
  {
    if (m_searchBar.OnCmdMsg(nID,nCode,pExtra,pHandlerInfo))
      return TRUE;
  }

  // Then pump through frame
  if (CWnd::OnCmdMsg(nID,nCode,pExtra,pHandlerInfo))
    return TRUE;

  // Then pump through application
  if (AfxGetApp()->OnCmdMsg(nID,nCode,pExtra,pHandlerInfo))
    return TRUE;
  return FALSE;
}

void ProjectFrame::OnUpdateFrameTitle(BOOL)
{
  CString title;
  title.Format("%s - %s",(LPCSTR)GetDisplayName(true),m_strTitle);
  AfxSetWindowText(GetSafeHwnd(),title);
}

void ProjectFrame::GetMessageString(UINT nID, CString& rMessage) const
{
  if ((nID >= ID_EXTENSIONS_LIST) && (nID < ID_EXTENSIONS_LIST+MAX_MENU_EXTENSIONS))
  {
    const std::vector<InformApp::ExtLocation>& extensions = theApp.GetExtensions();
    int i = nID - ID_EXTENSIONS_LIST;
    if (i < (int)extensions.size())
    {
      if (extensions[i].system)
        rMessage.Format("Open the \"%s\" built-in extension",extensions[i].title.c_str());
      else
        rMessage.Format("Open the \"%s\" extension",extensions[i].title.c_str());
      return;
    }
  }
  else if ((nID >= ID_WINDOW_TAB_SOURCE) && (nID <= ID_WINDOW_TAB_SETTINGS))
  {
    CString name;
    GetMenu()->GetMenuString(nID,name,MF_BYCOMMAND);
    int len = name.Find('\t');
    if (len > 0)
      name.Truncate(len);
    name.Remove('&');
    rMessage.Format("Go to the %s panel",name);
    return;
  }
  else if ((nID >= ID_WINDOW_INDEX_CONTENTS) && (nID <= ID_WINDOW_INDEX_WORLD))
  {
    CString name;
    GetMenu()->GetMenuString(nID,name,MF_BYCOMMAND);
    int len = name.Find('\t');
    if (len > 0)
      name.Truncate(len);
    name.Remove('&');
    rMessage.Format("Go to the %s tab of the index",name);
    return;
  }
  else if ((nID >= ID_WINDOW_LIST) && (nID <= ID_WINDOW_LIST+8))
  {
    CArray<CFrameWnd*> frames;
    theApp.GetWindowFrames(frames);

    int i = nID-ID_WINDOW_LIST;
    if (i < frames.GetSize())
    {
      if (frames[i]->IsKindOf(RUNTIME_CLASS(ProjectFrame)))
      {
        rMessage.Format("Switch to the \"%s\" project",
          ((ProjectFrame*)frames[i])->GetDisplayName(false));
      }
      else if (frames[i]->IsKindOf(RUNTIME_CLASS(ExtensionFrame)))
      {
        rMessage.Format("Switch to the \"%s\" extension project",
          ((ExtensionFrame*)frames[i])->GetDisplayName(false));
      }
      return;
    }
  }

  MenuBarFrameWnd::GetMessageString(nID,rMessage);
}

LRESULT ProjectFrame::OnPlaySkein(WPARAM wparam, LPARAM)
{
  Skein::Node* current = m_skein.GetCurrent();
  Skein::Node* newNode = (Skein::Node*)wparam;

  // Change the current node
  m_skein.SetCurrent(newNode);

  // Check if the new node is reachable from the current node in the skein
  bool reachable = current->FindAncestor(newNode) != NULL;

  // Build and run if the game is not running, or if the new node is unreachable
  if (!m_game.IsRunning())
    OnReplayLast();
  else if (!reachable)
    OnReplayLast();
  else
    m_game.InputFromSkein();

  return 0;
}

LRESULT ProjectFrame::OnGameRunning(WPARAM wparam, LPARAM)
{
  return m_game.IsRunning() ? 1 : 0;
}

LRESULT ProjectFrame::OnGameWaiting(WPARAM wparam, LPARAM)
{
  return m_game.IsWaiting() ? 1 : 0;
}

LRESULT ProjectFrame::OnPaneHeading(WPARAM wparam, LPARAM)
{
  return ((TabResults*)GetPanel(0)->GetTab(Panel::Tab_Results))->GetTabHeight();
}

LRESULT ProjectFrame::OnSelectSide(WPARAM side, LPARAM)
{
  GetPanel((int)side)->SetActiveTab(GetPanel((int)side)->GetActiveTab());
  return 0;
}

LRESULT ProjectFrame::OnSelectView(WPARAM view, LPARAM wnd)
{
  int panel = 0;
  if (GetPanel(0)->IsChild(CWnd::FromHandle((HWND)wnd)))
    panel = 1;

  CString viewName((const char*)view);
  if (viewName == "source")
    GetPanel(panel)->SetActiveTab(Panel::Tab_Source);
  else if ((viewName == "error") || (viewName == "results"))
    GetPanel(panel)->SetActiveTab(Panel::Tab_Results);
  else if ((viewName == "game") || (viewName == "story"))
    GetPanel(panel)->SetActiveTab(Panel::Tab_Story);
  else if (viewName == "documentation")
    GetPanel(panel)->SetActiveTab(Panel::Tab_Doc);
  else if (viewName == "index")
    GetPanel(panel)->SetActiveTab(Panel::Tab_Index);
  else if (viewName == "skein")
    GetPanel(panel)->SetActiveTab(Panel::Tab_Skein);
  else if (viewName == "transcript")
    GetPanel(panel)->SetActiveTab(Panel::Tab_Transcript);
  return 0;
}

LRESULT ProjectFrame::OnPasteCode(WPARAM code, LPARAM)
{
  ((TabSource*)GetPanel(0)->GetTab(Panel::Tab_Source))->PasteCode((const wchar_t*)code);
  return 0;
}

LRESULT ProjectFrame::OnRuntimeProblem(WPARAM problem, LPARAM)
{
  int panel = 0;
  if (((TabStory*)GetPanel(0)->GetTab(Panel::Tab_Story))->IsActive())
    panel = 1;

  ((TabResults*)GetPanel(panel)->GetTab(Panel::Tab_Results))->ShowRuntimeProblem((int)problem);
  GetPanel(panel)->SetActiveTab(Panel::Tab_Results);
  return 0;
}

LRESULT ProjectFrame::OnSearchSource(WPARAM text, LPARAM)
{
  Panel* panel = GetPanel(ChoosePanel(Panel::Tab_Source));
  panel->SetActiveTab(Panel::Tab_Source);
  m_search.Search((TabSource*)panel->GetTab(Panel::Tab_Source),(LPCWSTR)text,GetInitialSearchRect());
  return 0;
}

LRESULT ProjectFrame::OnSearchDoc(WPARAM text, LPARAM)
{
  Panel* panel = GetPanel(ChoosePanel(Panel::Tab_Doc));
  panel->SetActiveTab(Panel::Tab_Doc);
  m_search.Search((TabDoc*)panel->GetTab(Panel::Tab_Doc),(LPCWSTR)text,GetInitialSearchRect());
  return 0;
}

LRESULT ProjectFrame::OnShowTranscript(WPARAM wparam, LPARAM lparam)
{
  Skein::Node* node = (Skein::Node*)wparam;
  CWnd* wnd = CWnd::FromHandle((HWND)lparam);

  // If the transcript is not visible, use the same panel as the calling window
  int panel = -1;
  if (GetPanel(0)->GetActiveTab() == Panel::Tab_Transcript)
    panel = 0;
  else if (GetPanel(1)->GetActiveTab() == Panel::Tab_Transcript)
    panel = 1;
  else
    panel = GetPanel(0)->IsChild(wnd) ? 0 : 1;

  // Move the transcript to the given node for both panels, as this involves
  // more than just scrolling the transcript: the thread in the transcript
  // may be changed
  ((TabTranscript*)GetPanel(0)->GetTab(Panel::Tab_Transcript))->ShowNode(node,Skein::ShowSelect);
  ((TabTranscript*)GetPanel(1)->GetTab(Panel::Tab_Transcript))->ShowNode(node,Skein::ShowSelect);

  // Show the appropriate panel
  GetPanel(panel)->SetActiveTab(Panel::Tab_Transcript);

  // Send out a skein notification to the skein
  m_skein.NotifyChange(Skein::TranscriptThreadChanged);
  return 0;
}

LRESULT ProjectFrame::OnShowSkein(WPARAM wparam, LPARAM lparam)
{
  Skein::Node* node = (Skein::Node*)wparam;
  if (m_skein.IsValidNode(node) == false)
    return 0;

  CWnd* wnd = CWnd::FromHandle((HWND)lparam);

  // If the skein is not visible, use the same panel as the calling window
  Panel* panel = NULL;
  if (GetPanel(0)->GetActiveTab() == Panel::Tab_Skein)
    panel = GetPanel(0);
  else if (GetPanel(1)->GetActiveTab() == Panel::Tab_Skein)
    panel = GetPanel(1);
  else
    panel = GetPanel(GetPanel(0)->IsChild(wnd) ? 0 : 1);

  // Move the skein to the given node and show the tab
  ((TabSkein*)panel->GetTab(Panel::Tab_Skein))->ShowNode(node,Skein::JustShow);
  panel->SetActiveTab(Panel::Tab_Skein);
  return 0;
}

LRESULT ProjectFrame::OnTerpFailed(WPARAM wparam, LPARAM lparam)
{
  int panel = 1;
  if (((TabStory*)GetPanel(0)->GetTab(Panel::Tab_Story))->IsActive())
    panel = 0;

  ((TabResults*)GetPanel(panel)->GetTab(Panel::Tab_Results))->ShowTerpFailed();
  GetPanel(panel)->SetActiveTab(Panel::Tab_Results);
  return 0;
}

LRESULT ProjectFrame::OnProjectDir(WPARAM wparam, LPARAM lparam)
{
  return (LRESULT)(LPCSTR)m_projectDir;
}

LRESULT ProjectFrame::OnTranscriptEnd(WPARAM wparam, LPARAM lparam)
{
  return (LRESULT)((TabTranscript*)GetPanel(0)->GetTab(Panel::Tab_Transcript))->GetEndNode();
}

LRESULT ProjectFrame::OnPlayNextThread(WPARAM wparam, LPARAM lparam)
{
  // Get the next skein thread task, if any
  if (m_playThreads.empty())
    return 0;
  PlaySkein play = m_playThreads.front();
  m_playThreads.pop();

  // Take the appropriate action
  switch (play.action)
  {
  case PlaySkeinThread:
    // Make sure that the node is still valid
    if (m_skein.IsValidNode(play.node) == false)
      return 0;

    // Play the node without recompiling
    m_skein.SetCurrent(play.node);
    m_game.StopInterpreter(false);
    m_skein.Reset(false);
    RunProject();
    break;
  case ShowFirstSkeinError:
    {
      // Get the first skein node that is in error
      Skein::Node* node = m_skein.GetFirstDifferent();
      if (node != NULL)
        PostMessage(WM_SHOWSKEIN,(WPARAM)node,0);
      else
        ::MessageBeep(MB_ICONEXCLAMATION);
    }
    break;
  default:
    ASSERT(FALSE);
    break;
  }
  return 1;
}

LRESULT ProjectFrame::OnCanPlayAll(WPARAM wparam, LPARAM lparam)
{
  std::vector<Skein::Node*> blessed;
  m_skein.GetBlessedThreadEnds(blessed);
  return blessed.empty() ? 0 : 1;
}

LRESULT ProjectFrame::OnProjectEdited(WPARAM wparam, LPARAM lparam)
{
  DelayUpdateFrameTitle();
  return 0;
}

LRESULT ProjectFrame::OnExtDownload(WPARAM urls, LPARAM)
{
  m_busy = true;
  CStringArray* libraryUrls = (CStringArray*)urls;
  ExtensionFrame::DownloadExtensions(this,libraryUrls);
  delete libraryUrls;
  m_busy = false;
  return 0;
}

LRESULT ProjectFrame::OnProgress(WPARAM wp, LPARAM)
{
  int pos = (int)wp;
  if (pos >= 0)
  {
    m_progress.SetPos(pos);

    CRect progressRect;
    m_statusBar.GetItemRect(0,progressRect);
    progressRect.left += progressRect.Width()*3/4;

    // Make the progress bar visible
    m_progress.MoveWindow(progressRect,FALSE);
    m_progress.ShowWindow(SW_SHOW);
  }
  else
  {
    // Make the progress bar invisible
    m_progress.ShowWindow(SW_HIDE);
  }
  return 0;
}

CString ProjectFrame::GetDisplayName(bool showEdited)
{
  CString name = m_projectDir;
  if (name.IsEmpty())
    name = "Untitled";

  if (IsProjectEdited() && showEdited)
    name += '*';

  int start = name.ReverseFind('\\');
  return ((LPCSTR)name)+start+1;
}

void ProjectFrame::SendChanged(InformApp::Changed changed, int value)
{
  switch (changed)
  {
  case InformApp::Extensions:
    UpdateExtensionsMenu();
    break;
  case InformApp::Preferences:
    {
      CRegKey registryKey;
      if (registryKey.Open(HKEY_CURRENT_USER,REGISTRY_PATH_WINDOW,KEY_READ) == ERROR_SUCCESS)
      {
        DWORD I6debug = 0;
        if (registryKey.QueryDWORDValue("Generate I6 Debug",I6debug) == ERROR_SUCCESS)
          m_I6debug = (I6debug != 0);

        GetPanel(0)->PrefsChanged(registryKey);
        GetPanel(1)->PrefsChanged(registryKey);
      }
      m_game.PrefsChanged();
    }
    break;
  case InformApp::Spelling:
    ((TabSource*)GetPanel(0)->GetTab(Panel::Tab_Source))->UpdateSpellCheck();
    ((TabSource*)GetPanel(1)->GetTab(Panel::Tab_Source))->UpdateSpellCheck();
    break;
  case InformApp::DownloadedExt:
    for (int i = 0; i < 2; i++)
      ((TabExtensions*)GetPanel(i)->GetTab(Panel::Tab_Extensions))->DownloadedExt(value);
    break;
  }
}

void ProjectFrame::OnFileNew()
{
  SaveSettings();
  StartNewProject(m_projectDir,this);
}

void ProjectFrame::OnFileOpen()
{
  SaveSettings();
  StartExistingProject(m_projectDir,this);
}

void ProjectFrame::OnFileInstallExt()
{
  if (ExtensionFrame::InstallExtensions(this))
  {
    // Show the help on installed extensions
    OnHelpExtensions();
  }
}

void ProjectFrame::OnFileNewExt()
{
  SaveSettings();
  ExtensionFrame::StartNew(this,m_settings);
}

void ProjectFrame::OnFileOpenExt(UINT nID)
{
  int index = nID-ID_EXTENSIONS_LIST;
  const std::vector<InformApp::ExtLocation>& extensions = theApp.GetExtensions();
  if ((index >= 0) && (index < (int)extensions.size()))
  {
    SaveSettings();
    ExtensionFrame::StartExisting(extensions[index].path.c_str(),m_settings);
  }
}

void ProjectFrame::OnFileClose()
{
  if (!m_busy)
    SendMessage(WM_CLOSE);
}

void ProjectFrame::OnFileSave()
{
  if (!m_busy)
    SaveProject(m_projectDir);
}

void ProjectFrame::OnFileSaveAs()
{
  if (!m_busy)
  {
    // Ask for a project to save as
    ProjectDirDialog dialog(false,m_projectDir,"Save the project",this);
    if (dialog.ShowDialog() == IDOK)
      SaveProject(dialog.GetProjectDir());
  }
}

void ProjectFrame::OnFileImportSkein()
{
  // Ask the user for a file to import
  SimpleFileDialog dialog(TRUE,"rec",NULL,OFN_HIDEREADONLY|OFN_ENABLESIZING,
    "Interpreter recording files (*.rec;*.*)|*.*||",this);
  dialog.m_ofn.lpstrTitle = "Select the file to import into the skein";
  if (dialog.DoModal() == IDOK)
    m_skein.Import(dialog.GetPathName());
}

void ProjectFrame::OnUpdateElasticTabStops(CCmdUI *pCmdUI)
{
  pCmdUI->SetCheck(m_settings.m_elasticTabStops);
}

void ProjectFrame::OnFormatElasticTabStops()
{
  m_settings.m_elasticTabStops = !m_settings.m_elasticTabStops;
  m_settings.m_changed = true;

  ((TabSource*)GetPanel(0)->GetTab(Panel::Tab_Source))->SetElasticTabStops(m_settings.m_elasticTabStops);
}

void ProjectFrame::OnUpdateCompile(CCmdUI *pCmdUI)
{
  pCmdUI->Enable(!m_busy);
}

void ProjectFrame::OnPlayGo()
{
  if (CompileProject(0))
  {
    m_skein.Reset(true);
    RunProject();
  }
}

void ProjectFrame::OnPlayTest()
{
  if (CompileProject(0))
  {
    m_skein.Reset(true);
    m_skein.NewLine(L"test me");
    m_skein.Reset(false);
    RunProject();
  }
}

void ProjectFrame::OnUpdatePlayStop(CCmdUI *pCmdUI)
{
  pCmdUI->Enable(m_game.IsRunning() ? TRUE : FALSE);
}

void ProjectFrame::OnPlayStop()
{
  m_game.StopInterpreter(false);
}

void ProjectFrame::OnPlayRefresh()
{
  // Get the current focus window
  HWND focus = GetFocus()->GetSafeHwnd();

  // Compile the project and show the index
  if (CompileProject(0))
    GetPanel(ChoosePanel(Panel::Tab_Index))->SetActiveTab(Panel::Tab_Index);

  // Return the focus to its original point if still visible
  if (::IsWindow(focus) && ::IsWindowVisible(focus))
    ::SetFocus(focus);
}

void ProjectFrame::OnPlayLoad()
{
  SimpleFileDialog dialog(TRUE,NULL,NULL,OFN_HIDEREADONLY|OFN_ENABLESIZING,
    "Z-code games (*.z?;*.zblorb)|*.z?;*.zblorb|Glulx games (*.ulx;*.gblorb)|*.ulx;*.gblorb||",this);
  dialog.m_ofn.lpstrTitle = "Select a story to play";
  dialog.m_ofn.nFilterIndex = m_loadFilter;
  if (dialog.DoModal() != IDOK)
    return;

  CString path = dialog.GetPathName();
  int split = path.ReverseFind('\\');
  if (split == -1)
    return;

  m_game.StopInterpreter(false);
  m_skein.Reset(true);

  GetPanel(ChoosePanel(Panel::Tab_Story))->SetActiveTab(Panel::Tab_Story);
  m_loadFilter = dialog.m_ofn.nFilterIndex;
  bool glulx = (m_loadFilter == 2);
  m_game.RunInterpreter(path.Left(split),path.Mid(split+1),glulx);
}

void ProjectFrame::OnReplayLast()
{
  if (CompileProject(0))
  {
    m_skein.Reset(false);
    RunProject();
  }
}

void ProjectFrame::OnUpdateReplayBlessed(CCmdUI *pCmdUI)
{
  bool enable = !m_busy;
  if (enable)
    enable = SendMessage(WM_CANPLAYALL) != 0;
  pCmdUI->Enable(enable);
}

void ProjectFrame::OnReplayBlessed()
{
  // Discard any previous threads to be played
  while (!m_playThreads.empty())
    m_playThreads.pop();

  // Find all the end skein nodes that have an expected transcript
  std::vector<Skein::Node*> blessed;
  m_skein.GetBlessedThreadEnds(blessed);
  if (blessed.empty())
    return;

  // Get the first node and store the rest
  Skein::Node* firstNode = blessed[0];
  for (size_t i = 1; i < blessed.size(); i++)
  {
    PlaySkein play;
    play.action = PlaySkeinThread;
    play.node = blessed[i];
    m_playThreads.push(play);
  }

  // Add a final task to show the first skein error
  PlaySkein showError;
  showError.action = ShowFirstSkeinError;
  showError.node = NULL;
  m_playThreads.push(showError);

  // Play the thread leading to the first node
  m_skein.SetCurrent(firstNode);
  OnReplayLast();
}

void ProjectFrame::OnReplayShowLast()
{
  // Move the transcript to the given node for both panels, as this involves
  // more than just scrolling the transcript: the thread in the transcript
  // may be changed
  Skein::Node* node = m_skein.GetCurrent();
  ((TabTranscript*)GetPanel(0)->GetTab(Panel::Tab_Transcript))->ShowNode(node,Skein::JustShow);
  ((TabTranscript*)GetPanel(1)->GetTab(Panel::Tab_Transcript))->ShowNode(node,Skein::JustShow);

  // Show the appropriate panel
  Panel* panel = GetPanel(ChoosePanel(Panel::Tab_Transcript));
  panel->SetActiveTab(Panel::Tab_Transcript);

  // Send out a skein notification to the skein
  m_skein.NotifyChange(Skein::TranscriptThreadChanged);
}

void ProjectFrame::OnReplayShowLastSkein()
{
  SendMessage(WM_SHOWSKEIN,(WPARAM)m_skein.GetCurrent(),0);
}

void ProjectFrame::OnUpdateReplayChanged(CCmdUI *pCmdUI)
{
  TabTranscript* tab = (TabTranscript*)(GetPanel(0)->GetTab(Panel::Tab_Transcript));
  Skein::Node* node = tab->FindRelevantNode(
    TranscriptWindow::TranscriptChanged,pCmdUI->m_nID == ID_REPLAY_CHANGED_NEXT);
  pCmdUI->Enable(node != NULL);
}

void ProjectFrame::OnReplayChanged(UINT nID)
{
  // Find the node to move to
  TabTranscript* tab = (TabTranscript*)(GetPanel(0)->GetTab(Panel::Tab_Transcript));
  Skein::Node* node = tab->FindRelevantNode(
    TranscriptWindow::TranscriptChanged,nID == ID_REPLAY_CHANGED_NEXT);
  if (node == NULL)
    return;

  // Move the transcript to the given node for both panels
  ((TabTranscript*)GetPanel(0)->GetTab(Panel::Tab_Transcript))->ShowNode(node,Skein::ShowSelect);
  ((TabTranscript*)GetPanel(1)->GetTab(Panel::Tab_Transcript))->ShowNode(node,Skein::ShowSelect);

  // Show the appropriate panel
  Panel* panel = GetPanel(ChoosePanel(Panel::Tab_Transcript));
  panel->SetActiveTab(Panel::Tab_Transcript);
  m_skein.NotifyChange(Skein::TranscriptThreadChanged);
}

void ProjectFrame::OnUpdateReplayDiffer(CCmdUI *pCmdUI)
{
  TabTranscript* tab = (TabTranscript*)(GetPanel(0)->GetTab(Panel::Tab_Transcript));
  Skein::Node* node = tab->FindRelevantNode(
    TranscriptWindow::TranscriptDifferent,pCmdUI->m_nID == ID_REPLAY_DIFF_NEXT);
  pCmdUI->Enable(node != NULL);
}

void ProjectFrame::OnReplayDiffer(UINT nID)
{
  // Find the node to move to
  TabTranscript* tab = (TabTranscript*)(GetPanel(0)->GetTab(Panel::Tab_Transcript));
  Skein::Node* node = tab->FindRelevantNode(
    TranscriptWindow::TranscriptDifferent,nID == ID_REPLAY_DIFF_NEXT);
  if (node == NULL)
    return;

  // Move the transcript to the given node for both panels
  ((TabTranscript*)GetPanel(0)->GetTab(Panel::Tab_Transcript))->ShowNode(node,Skein::ShowSelect);
  ((TabTranscript*)GetPanel(1)->GetTab(Panel::Tab_Transcript))->ShowNode(node,Skein::ShowSelect);

  // Show the appropriate panel
  Panel* panel = GetPanel(ChoosePanel(Panel::Tab_Transcript));
  panel->SetActiveTab(Panel::Tab_Transcript);
  m_skein.NotifyChange(Skein::TranscriptThreadChanged);
}

void ProjectFrame::OnUpdateReplayDifferSkein(CCmdUI *pCmdUI)
{
  TabTranscript* tab = (TabTranscript*)(GetPanel(0)->GetTab(Panel::Tab_Transcript));
  Skein::Node* node = tab->FindRelevantNode(TranscriptWindow::SkeinDifferent,true);
  pCmdUI->Enable(node != NULL);
}

void ProjectFrame::OnReplayDifferSkein()
{
  // Find the node to move to
  TabTranscript* tab = (TabTranscript*)(GetPanel(0)->GetTab(Panel::Tab_Transcript));
  Skein::Node* node = tab->FindRelevantNode(TranscriptWindow::SkeinDifferent,true);
  if (node == NULL)
    return;

  // Move the transcript to the given node for both panels
  ((TabTranscript*)GetPanel(0)->GetTab(Panel::Tab_Transcript))->ShowNode(node,Skein::ShowSelect);
  ((TabTranscript*)GetPanel(1)->GetTab(Panel::Tab_Transcript))->ShowNode(node,Skein::ShowSelect);

  // Show the appropriate panel
  Panel* panel = GetPanel(ChoosePanel(Panel::Tab_Transcript));
  panel->SetActiveTab(Panel::Tab_Transcript);
  m_skein.NotifyChange(Skein::TranscriptThreadChanged);
}

void ProjectFrame::OnUpdateReleaseGame(CCmdUI *pCmdUI)
{
  pCmdUI->Enable(!m_busy);
}

void ProjectFrame::OnReleaseGame(UINT nID)
{
  if (CompileProject((nID == ID_RELEASE_GAME) ? 2 : 1))
  {
    CString releasePath;
    const char* blorbExt = NULL;
    const char* filter = NULL;

    if (m_settings.m_output == ProjectSettings::OutputGlulx)
    {
      blorbExt = "gblorb";
      filter = "Glulx games (*.ulx;*.gblorb)|*.ulx;*.gblorb|All Files (*.*)|*.*||";
    }
    else
    {
      blorbExt = "zblorb";
      filter = "Z-code games (.z?;.zblorb)|*.z?;*.zblorb|All Files (*.*)|*.*||";
    }

    // Create a Blorb file, if needed
    if (m_settings.m_blorb)
    {
      CString executable, arguments;
      executable.Format("%s\\Compilers\\cblorb",(LPCSTR)theApp.GetAppDir());
      arguments.Format("-windows Release.blurb Build\\output.%s",blorbExt);

      CString output;
      output.Format("%s \\\n    %s\n",(LPCSTR)executable,(LPCSTR)arguments);
      Output(output);

      CString cmdLine;
      cmdLine.Format("\"%s\" %s",(LPCSTR)executable,(LPCSTR)arguments);

      m_outputFileLoc.Empty();
      int code = theApp.RunCommand(m_projectDir,cmdLine,*this);

      GetPanel(0)->CompileProject(TabInterface::RanCBlorb,code);
      GetPanel(1)->CompileProject(TabInterface::RanCBlorb,code);

      // If creating the Blorb file failed, stop
      if (code != 0)
        return;

      // If cBlorb picked a location to save the file, use it
      releasePath = m_outputFileLoc;
    }

    // Get the appropriate file name extension
    CString extension = m_settings.m_blorb ? blorbExt : m_settings.GetOutputExtension();

    // Should we ask the user where to copy to?
    if (releasePath.IsEmpty())
    {
      // Work out a suitable output file name
      CString fileName = GetDisplayName(false);
      fileName.Truncate(fileName.ReverseFind('.')+1);
      fileName.Append(extension);

      // Ask the user where to save
      SimpleFileDialog dialog(FALSE,extension,fileName,
        OFN_HIDEREADONLY|OFN_ENABLESIZING|OFN_OVERWRITEPROMPT,filter,this);
      dialog.m_ofn.lpstrTitle = "Save the story for release";
      if (dialog.DoModal() == IDOK)
        releasePath = dialog.GetPathName();
    }

    // Copy the game file
    if (releasePath.IsEmpty() == FALSE)
      ::CopyFile(m_projectDir+"\\Build\\output."+extension,releasePath,FALSE);
  }
}

void ProjectFrame::OnReleaseMaterials()
{
  // Get the path to the ".materials" directory
  int projectExt = m_projectDir.Find(".inform");
  if (projectExt == -1)
    return;
  CString path;
  path.Format("%s.materials",m_projectDir.Left(projectExt));

  // If it doesn't exist, create it
  if (::GetFileAttributes(path) == INVALID_FILE_ATTRIBUTES)
    theOS.SHCreateDirectoryEx(this,path);

  // Open an Explorer window
  ::ShellExecute(0,"explore",path,NULL,NULL,SW_SHOWNORMAL);
}

void ProjectFrame::OnReleaseIFiction()
{
  // Compile the project
  bool fileCreated = false;
  if (CompileProject(0))
  {
    // Check for an iFiction file
    CString iFictionFile;
    iFictionFile.Format("%s\\Metadata.iFiction",(LPCSTR)m_projectDir);
    if (::GetFileAttributes(iFictionFile) != INVALID_FILE_ATTRIBUTES)
    {
      fileCreated = true;

      // Ask the user where the file is to be copied
      SimpleFileDialog dialog(FALSE,"iFiction",NULL,OFN_HIDEREADONLY|OFN_ENABLESIZING,
        "iFiction metadata (*.iFiction)|*.iFiction|All Files (*.*)|*.*||",this);
      dialog.m_ofn.lpstrTitle = "Save iFiction record";
      if (dialog.DoModal() == IDOK)
        ::CopyFile(iFictionFile,dialog.GetPathName(),FALSE);
    }
  }

  if (!fileCreated)
  {
    MessageBox(
      "The compiler failed to create an iFiction record;\n"
      "check the errors page to see why.",INFORM_TITLE,MB_OK|MB_ICONERROR);
  }
}

void ProjectFrame::OnWindowLeftPane()
{
  // Switch the focus to the left panel
  GetPanel(0)->SetActiveTab(GetPanel(0)->GetActiveTab());
}

void ProjectFrame::OnWindowRightPane()
{
  // Switch the focus to the right panel
  GetPanel(1)->SetActiveTab(GetPanel(1)->GetActiveTab());
}

void ProjectFrame::OnWindowSwitchPanes()
{
  // Switch the focus to the other panel
  if (GetPanel(0)->IsChild(GetFocus()))
    GetPanel(1)->SetActiveTab(GetPanel(1)->GetActiveTab());
  else
    GetPanel(0)->SetActiveTab(GetPanel(0)->GetActiveTab());
}

void ProjectFrame::OnWindowShowTab(UINT nID)
{
  int index = nID-ID_WINDOW_TAB_SOURCE;
  Panel::Tabs tab = (Panel::Tabs)(Panel::Tab_Source+index);
  int panel = GetPanel(0)->IsChild(GetFocus()) ? 0 : 1;
  GetPanel(panel)->SetActiveTab(tab);
}

void ProjectFrame::OnWindowShowIndex(UINT nID)
{
  int index = nID-ID_WINDOW_INDEX_CONTENTS;
  Panel* panel = GetPanel(ChoosePanel(Panel::Tab_Index));
  ((TabIndex*)panel->GetTab(Panel::Tab_Index))->ShowIndex(index);
  panel->SetActiveTab(Panel::Tab_Index);
}

void ProjectFrame::OnUpdateWindowList(CCmdUI *pCmdUI)
{
  CMenu* windowMenu = GetMenu()->GetSubMenu(6);
  int maximum = 9;

  // Remove any existing items in the window list
  for (int i = 0; i < maximum; i++)
    windowMenu->RemoveMenu(ID_WINDOW_LIST+i,MF_BYCOMMAND);

  CArray<CFrameWnd*> frames;
  theApp.GetWindowFrames(frames);

  if (frames.GetSize() < maximum)
    maximum = (int)frames.GetSize();

  // Add a menu for each window frame open
  for (int i = 0; i < maximum; i++)
  {
    CString name, menu;

    if (frames[i]->IsKindOf(RUNTIME_CLASS(ProjectFrame)))
      name = ((ProjectFrame*)frames[i])->GetDisplayName(true);
    else if (frames[i]->IsKindOf(RUNTIME_CLASS(ExtensionFrame)))
      name = ((ExtensionFrame*)frames[i])->GetDisplayName(true);

    menu.Format("&%d %s",i+1,(LPCSTR)name);

    UINT flags = (frames[i] == this) ? MF_CHECKED|MF_STRING : MF_STRING;
    windowMenu->AppendMenu(flags,ID_WINDOW_LIST+i,menu);
  }
}

void ProjectFrame::OnWindowList(UINT nID)
{
  CArray<CFrameWnd*> frames;
  theApp.GetWindowFrames(frames);

  int index = nID-ID_WINDOW_LIST;
  if ((index >= 0) && (index < frames.GetSize()))
    frames[index]->ActivateFrame();
}

void ProjectFrame::OnHelpIndex()
{
  Panel* panel = GetPanel(ChoosePanel(Panel::Tab_Doc));
  ((TabDoc*)panel->GetTab(Panel::Tab_Doc))->Show(
    theApp.GetAppDir()+"\\Documentation\\index.html");
  panel->SetActiveTab(Panel::Tab_Doc);
}

void ProjectFrame::OnHelpLicence()
{
  Panel* panel = GetPanel(ChoosePanel(Panel::Tab_Doc));
  ((TabDoc*)panel->GetTab(Panel::Tab_Doc))->Show(
    theApp.GetAppDir()+"\\Documentation\\licences\\licence.html");
  panel->SetActiveTab(Panel::Tab_Doc);
}

void ProjectFrame::OnHelpWindows()
{
  Panel* panel = GetPanel(ChoosePanel(Panel::Tab_Doc));
  ((TabDoc*)panel->GetTab(Panel::Tab_Doc))->Show(
    theApp.GetAppDir()+"\\Documentation\\windows\\Windows.html");
  panel->SetActiveTab(Panel::Tab_Doc);
}

void ProjectFrame::OnHelpExtensions()
{
  Panel* panel = GetPanel(ChoosePanel(Panel::Tab_Extensions));
  ((TabExtensions*)panel->GetTab(Panel::Tab_Extensions))->Show(
    theApp.GetHomeDir()+"\\Inform\\Documentation\\Extensions.html");
  panel->SetActiveTab(Panel::Tab_Extensions);
}

void ProjectFrame::OnHelpRecipes()
{
  CString recipePath = theApp.GetAppDir()+"\\Documentation\\Rindex.html";
  if (::GetFileAttributes(recipePath) == INVALID_FILE_ATTRIBUTES)
    recipePath = theApp.GetAppDir()+"\\Documentation\\Rdoc1.html";

  Panel* panel = GetPanel(ChoosePanel(Panel::Tab_Doc));
  ((TabDoc*)panel->GetTab(Panel::Tab_Doc))->Show(recipePath);
  panel->SetActiveTab(Panel::Tab_Doc);
}

void ProjectFrame::OnSearchSource()
{
  m_searchBar.SearchSource();
}

void ProjectFrame::OnSearchDocs()
{
  m_searchBar.SearchDocs();
}

ProjectFrame* ProjectFrame::NewFrame(void)
{
  ProjectFrame* frame = new ProjectFrame;
  theApp.NewFrame(frame);

  frame->LoadFrame(IDR_MAINFRAME,WS_OVERLAPPEDWINDOW|FWS_ADDTOTITLE,NULL,NULL);
  frame->SetFromRegistryPath(REGISTRY_PATH_WINDOW);
  frame->ShowWindow(SW_SHOW);
  frame->UpdateWindow();

  BOOL cues;
  if (::SystemParametersInfo(SPI_GETKEYBOARDCUES,0,&cues,0) == 0)
    cues = TRUE;
  frame->SendMessage(WM_CHANGEUISTATE,MAKEWPARAM(cues ? UIS_CLEAR : UIS_SET,UISF_HIDEFOCUS));

  return frame;
}

void ProjectFrame::SetFromRegistryPath(const char* path)
{
  if (m_registryKey.Create(HKEY_CURRENT_USER,path) == ERROR_SUCCESS)
  {
    // Restore the window state
    WINDOWPLACEMENT place;
    ULONG len = sizeof WINDOWPLACEMENT;
    if (m_registryKey.QueryBinaryValue("Placement",&place,&len) == ERROR_SUCCESS)
      SetWindowPlacement(&place);
    else
    {
      CRect screen;
      ::SystemParametersInfo(SPI_GETWORKAREA,0,(LPRECT)screen,0);
      MoveWindow(0,0,screen.Width()*7/8,screen.Height()*9/10,FALSE);
      CenterWindow();
    }

    // Restore the splitter position
    DWORD splitter;
    if (m_registryKey.QueryDWORDValue("Splitter",splitter) == ERROR_SUCCESS)
      m_splitter.SetColumnInfo(0,splitter,16);
    else
    {
      int size0, size1, min;
      m_splitter.GetColumnInfo(0,size0,min);
      m_splitter.GetColumnInfo(1,size1,min);
      m_splitter.SetColumnInfo(0,(size0+size1)/2,16);
    }
    m_splitter.RecalcLayout();

    // Restore the default project directory for the file dialog
    char dir[MAX_PATH];
    len = sizeof dir;
    if (m_registryKey.QueryStringValue("Last Project",dir,&len) == ERROR_SUCCESS)
      m_projectDir = dir;

    // Restore whether or not to generate Inform 6 debugging output
    DWORD I6debug = 0;
    if (m_registryKey.QueryDWORDValue("Generate I6 Debug",I6debug) == ERROR_SUCCESS)
      m_I6debug = (I6debug != 0);
    
    // Allow tabs to load settings
    for (int i = 0; i < 2; i++)
      GetPanel(i)->LoadSettings(m_registryKey);
  }
}

void ProjectFrame::SaveSettings(void)
{
  if ((HKEY)m_registryKey != 0)
  {
    // Save the window state
    WINDOWPLACEMENT place;
    place.length = sizeof place;
    GetWindowPlacement(&place);
    m_registryKey.SetBinaryValue("Placement",&place,sizeof WINDOWPLACEMENT);

    // Save the splitter position
    int current, minimum;
    m_splitter.GetColumnInfo(0,current,minimum);
    m_registryKey.SetDWORDValue("Splitter",current);

    // Save the default project directory for the file dialog
    m_registryKey.SetStringValue("Last Project",m_projectDir);

    // Allow tabs to save settings
    GetPanel(0)->SaveSettings(m_registryKey);
  }
}

bool ProjectFrame::StartNewProject(const char* dir, CWnd* parent)
{
  NewProjectDialog dialog(dir,parent);
  if (dialog.DoModal() != IDOK)
    return false;

  CStringW initialCode;
  initialCode.Format(L"\"%S\" by %s\r\r",dialog.GetName(),dialog.GetAuthor());

  ProjectFrame* frame = NewFrame();
  ((TabSource*)frame->GetPanel(0)->GetTab(Panel::Tab_Source))->PasteCode(initialCode);

  frame->SaveProject(dialog.GetPath());
  frame->GetPanel(0)->SetActiveTab(Panel::Tab_Source);
  return true;
}

bool ProjectFrame::StartExistingProject(const char* dir, CWnd* parent)
{
  ProjectDirDialog dialog(true,dir,"Open a project",parent);
  if (dialog.ShowDialog() != IDOK)
    return false;

  ProjectFrame* frame = NewFrame();
  frame->OpenProject(dialog.GetProjectDir());
  return true;
}

bool ProjectFrame::StartLastProject(void)
{
  ProjectFrame* frame = NewFrame();
  frame->OpenProject(frame->m_projectDir);
  return true;
}

void ProjectFrame::OpenProject(const char* project)
{
  // Stop the game if running
  m_game.StopInterpreter(true);

  // As this can take a while, make sure the display is updated
  theApp.RunMessagePump();

  // Set the project directory
  m_projectDir = project;

  // Rename any old-style " Materials" folder to ".materials"
  int projectExt = m_projectDir.Find(".inform");
  if (projectExt > 0)
  {
    CString fromPath, toPath;
    fromPath.Format("%s Materials",m_projectDir.Left(projectExt));
    toPath.Format("%s.materials",m_projectDir.Left(projectExt));
    ::MoveFile(fromPath,toPath);
  }

  // Open files in the project
  GetPanel(0)->OpenProject(m_projectDir,true);
  GetPanel(1)->OpenProject(m_projectDir,false);
  GetPanel(0)->SetActiveTab(Panel::Tab_Source);

  // Update elastic tabstops, if in use
  ((TabSource*)GetPanel(0)->GetTab(Panel::Tab_Source))->SetElasticTabStops(m_settings.m_elasticTabStops);
}

bool ProjectFrame::SaveProject(const char* project)
{
  theApp.RunMessagePump();

  // Create project directories
  m_projectDir = project;
  ::CreateDirectory(m_projectDir,NULL);
  ::CreateDirectory(m_projectDir+"\\Build",NULL);
  ::CreateDirectory(m_projectDir+"\\Index",NULL);
  ::CreateDirectory(m_projectDir+"\\Source",NULL);

  // Save the project from the left hand panel
  bool saved = GetPanel(0)->SaveProject(m_projectDir,true);
  GetPanel(1)->SaveProject(m_projectDir,false);
  return saved;
}

bool ProjectFrame::CompileProject(int release)
{
  // Stop the game if running
  m_game.StopInterpreter(false);

  // Save the project first
  if (SaveProject(m_projectDir) == false)
    return false;

  // Create the UUID file if needed
  CString uuidFile;
  uuidFile.Format("%s\\uuid.txt",(LPCSTR)m_projectDir);
  if (::GetFileAttributes(uuidFile) == INVALID_FILE_ATTRIBUTES)
  {
    UUID uuid;
    ::UuidCreate(&uuid);
    unsigned char* uuidStr;
    ::UuidToString(&uuid,&uuidStr);

    FILE* f = fopen(uuidFile,"wt");
    if (f != NULL)
    {
      fwrite(uuidStr,1,strlen((const char*)uuidStr),f);
      fclose(f);
    }

    ::RpcStringFree(&uuidStr);
  }

  // Start compiling ...
  m_busy = true;

  // Get the current focus window
  HWND focus = GetFocus()->GetSafeHwnd();

  // Notify panels that compilation is starting
  GetPanel(0)->CompileProject(TabInterface::CompileStart,0);
  GetPanel(1)->CompileProject(TabInterface::CompileStart,0);

  // Run Natural Inform
  int code = theApp.RunCommand(NULL,NaturalCommandLine(release >= 1),*this);

  // Notify panels that Natural Inform has been run
  GetPanel(0)->CompileProject(TabInterface::RanNaturalInform,code);
  GetPanel(1)->CompileProject(TabInterface::RanNaturalInform,code);

  // Run Inform 6
  if (code == 0)
  {
    code = theApp.RunCommand(m_projectDir+"\\Build",InformCommandLine(release >= 2),*this);
    if (code != 0)
      SetMessageText("Creating the story file with Inform 6 has failed");

    GetPanel(0)->CompileProject(TabInterface::RanInform6,code);
    GetPanel(1)->CompileProject(TabInterface::RanInform6,code);
  }

  // Show the final exit code
  CString final;
  final.Format("\nCompiler finished with code %d\n",code);
  Output(final);

  // Make the results panel visible
  GetPanel(ChoosePanel(Panel::Tab_Results))->SetActiveTab(Panel::Tab_Results);

  // Return the focus to its original point if still visible
  if (::IsWindow(focus) && ::IsWindowVisible(focus))
    ::SetFocus(focus);

  // Finished compiling
  m_busy = false;
  return (code == 0);
}

void ProjectFrame::RunProject(void)
{
  // Make the story panel visible
  GetPanel(ChoosePanel(Panel::Tab_Story))->SetActiveTab(Panel::Tab_Story);

  // Start the interpreter
  m_game.RunInterpreter(m_projectDir+"\\Build",
    "output."+m_settings.GetOutputExtension(),
    m_settings.m_output == ProjectSettings::OutputGlulx);

  // Send out a skein notification now that the game is running
  m_skein.NotifyChange(Skein::ThreadChanged);
}

void ProjectFrame::CleanProject(void)
{
  if ((HKEY)m_registryKey != 0)
  {
    DWORD cleanFiles;
    if (m_registryKey.QueryDWORDValue("Clean Up Files",cleanFiles) == ERROR_SUCCESS)
    {
      if (cleanFiles == 0)
        return;
    }
  }

  CFileFind find;
  BOOL found = find.FindFile(m_projectDir+"\\Build\\*.*");
  while (found)
  {
    found = find.FindNextFile();
    ::DeleteFile(find.GetFilePath());
  }

  bool indexes = true;
  if ((HKEY)m_registryKey != 0)
  {
    DWORD cleanIndexes;
    if (m_registryKey.QueryDWORDValue("Clean Up Indexes",cleanIndexes) == ERROR_SUCCESS)
      indexes = (cleanIndexes != 0);
  }

  if (indexes)
  {
    found = find.FindFile(m_projectDir+"\\Index\\Details\\*.*");
    while (found)
    {
      found = find.FindNextFile();
      ::DeleteFile(find.GetFilePath());
    }

    found = find.FindFile(m_projectDir+"\\Index\\*.*");
    while (found)
    {
      found = find.FindNextFile();
      ::DeleteFile(find.GetFilePath());
    }
  }
}

bool ProjectFrame::IsProjectEdited(void)
{
  return GetPanel(0)->IsProjectEdited();
}

void ProjectFrame::UpdateMenuParams(void)
{
  m_menuFonts[0].DeleteObject();
  m_menuFonts[1].DeleteObject();

  // Create the menu item fonts
  NONCLIENTMETRICS ncm;
  ncm.cbSize = sizeof ncm;
  ::SystemParametersInfo(SPI_GETNONCLIENTMETRICS,ncm.cbSize,&ncm,0);
  m_menuFonts[0].CreateFontIndirect(&ncm.lfMenuFont);
  ncm.lfMenuFont.lfHeight = (int)(0.9*ncm.lfMenuFont.lfHeight);
  m_menuFonts[1].CreateFontIndirect(&ncm.lfMenuFont);

  // Get the theme, if any
  HTHEME theme = 0;
  if (theOS.IsAppThemed())
    theme = theOS.OpenThemeData(this,L"MENU");

  // Get the menu item spacings
  if (theme != 0)
  {
    CDC* dc = GetDC();

    CSize szC(0,0);
    theOS.GetThemePartSize(theme,dc,11/*MENU_POPUPCHECK*/,0,TS_TRUE,&szC);
    MARGINS mrgC = {0}, mrgCb = {0};
    theOS.GetThemeMargins(theme,dc,11/*MENU_POPUPCHECK*/,0,TMT_CONTENTMARGINS,&mrgC);
    theOS.GetThemeMargins(theme,dc,12/*MENU_POPUPCHECKBACKGROUND*/,0,TMT_CONTENTMARGINS,&mrgCb);
    m_menuGutter = szC.cx+mrgC.cxLeftWidth+mrgC.cxRightWidth+mrgCb.cxLeftWidth+mrgCb.cxRightWidth;

    m_menuTextGap.cx = theOS.GetThemeInt(theme,9/*MENU_POPUPBACKGROUND*/,0,TMT_BORDERSIZE);
    CSize sz = dc->GetTextExtent("Test");
    m_menuTextGap.cy =
      szC.cy+mrgC.cyTopHeight+mrgC.cyBottomHeight+mrgCb.cyTopHeight+mrgCb.cyBottomHeight-sz.cy;
    m_menuTextGap.cy = max(0,m_menuTextGap.cy/2);

    ReleaseDC(dc);
    theOS.CloseThemeData(theme);
  }
  else
  {
    m_menuGutter = ::GetSystemMetrics(SM_CXMENUCHECK)+2;
    m_menuTextGap = CSize(2,2);
  }
}

void ProjectFrame::UpdateExtensionsMenu(void)
{
  CMenu* fileMenu = GetMenu()->GetSubMenu(0);
  ASSERT(fileMenu->GetMenuItemCount() == 13);
  CMenu* extMenu = fileMenu->GetSubMenu(9);
  ASSERT(extMenu != NULL);

  while (extMenu->GetMenuItemCount() > 0)
    extMenu->RemoveMenu(0,MF_BYPOSITION);

  int x = -1;
  HMENU authorMenu = 0;
  const std::vector<InformApp::ExtLocation>& extensions = theApp.GetExtensions();
  for (int i = 0; (i < MAX_MENU_EXTENSIONS) && (i < (int)extensions.size()); i++)
  {
    if ((x == -1) || (extensions[i].author != extensions[x].author))
    {
      authorMenu = ::CreatePopupMenu();
      extMenu->AppendMenu(MF_POPUP|MF_STRING,(UINT_PTR)authorMenu,extensions[i].author.c_str());
      x = i;
    }

    ASSERT(authorMenu != 0);
    ::AppendMenu(authorMenu,MF_OWNERDRAW,ID_EXTENSIONS_LIST+i,(LPCSTR)&(extensions[i]));
  }
}

CString ProjectFrame::NaturalCommandLine(bool release)
{
  CString dir = theApp.GetAppDir();
  CString extension = m_settings.GetOutputExtension();

  CString executable, arguments;
  executable.Format("%s\\Compilers\\ni",(LPCSTR)dir);
  arguments.Format(
    "%s%s-rules \"%s\\Inform7\\Extensions\" -package \"%s\" -extension=%s",
    (release ? "-release " : ""),
    ((m_settings.m_predictable && !release)) ? "-rng " : "",
    (LPCSTR)dir,(LPCSTR)m_projectDir,(LPCSTR)extension);

  CString output;
  output.Format("%s \\\n    %s\n",(LPCSTR)executable,(LPCSTR)arguments);
  Output(output);

  CString cmdLine;
  cmdLine.Format("\"%s\" %s",(LPCSTR)executable,(LPCSTR)arguments);
  return cmdLine;
}

CString ProjectFrame::InformCommandLine(bool release)
{
  CString dir = theApp.GetAppDir();
  CString switches = m_settings.GetInformSwitches(release,m_I6debug);
  CString extension = m_settings.GetOutputExtension();

  CString executable, arguments;
  executable.Format("%s\\Compilers\\inform6",(LPCSTR)dir);
  arguments.Format("%s +include_path=..\\Source,.\\ auto.inf output.%s",
    (LPCSTR)switches,(LPCSTR)extension);

  CString output;
  output.Format("\n%s \\\n    %s\n",(LPCSTR)executable,(LPCSTR)arguments);
  Output(output);

  CString cmdLine;
  cmdLine.Format("\"%s\" %s",(LPCSTR)executable,(LPCSTR)arguments);
  return cmdLine;
}

Panel* ProjectFrame::GetPanel(int column) const
{
  return (Panel*)m_splitter.GetPane(0,column);
}

int ProjectFrame::ChoosePanel(Panel::Tabs newTab)
{
  Panel::Tabs leftTab = GetPanel(0)->GetActiveTab();
  Panel::Tabs rightTab = GetPanel(1)->GetActiveTab();

  // If either panel is showing the same as the new, use that
  if (rightTab == newTab)
    return 1;
  else if (leftTab == newTab)
    return 0;

  // Always try to use the left panel for source
  if (newTab == Panel::Tab_Source)
    return 0;

  // If the right panel is not source, use that
  if (rightTab != Panel::Tab_Source)
    return 1;

  // Use the left panel unless that is source too
  return (leftTab == Panel::Tab_Source) ? 1 : 0;
}

// Implementation of InformApp::OutputSink
void ProjectFrame::Output(const char* msg)
{
  // Split the output message into lines
  const char* start = msg;
  while (*start != '\0')
  {
    const char* end = strchr(start,'\n');
    if (end != NULL)
      end++;
    else
      end = start+strlen(start);

    CString line(start,(int)(end-start));

    // Is this a progress line?
    if (line.Left(2) == "++")
    {
      // Decode progress information
      int percent;
      char progress[256];
      if (sscanf(line,"++ %d%% (%[^)]",&percent,progress) == 2)
      {
        SetMessageText(progress);
        SendMessage(WM_PROGRESS,percent);
      }
      else if (sscanf(line,"++ Ended: %[^^]",progress) == 1)
      {
        SetMessageText(progress);
        SendMessage(WM_PROGRESS,-1);
      }
    }
    else
    {
      SendMessage(WM_PROGRESS,-1);
      GetPanel(0)->Progress(line);
      GetPanel(1)->Progress(line);
    }

    // Is this a file location line?
    const char* limit1 = strchr(line,'[');
    if ((limit1 != NULL) && (*(limit1+1) == '['))
    {
      const char* limit2 = strchr(limit1,']');
      if ((limit2 != NULL) && (*(limit2+1) == ']'))
        m_outputFileLoc = CString(limit1+2,(int)(limit2-limit1-2));
    }
      
    start = end;
  }
}

void ProjectFrame::OnSourceLink(const char* url, TabInterface* from, COLORREF highlight)
{
  // Select the panel to show the source in
  int otherPanel = 0;
  if (GetPanel(0)->ContainsTab(from))
    otherPanel = 1;
  Panel* panel = GetPanel(otherPanel);

  // Show the source tab if the highlight is accepted
  if (((TabSource*)panel->GetTab(Panel::Tab_Source))->Highlight(url,highlight))
  {
    panel->SetActiveTab(Panel::Tab_Source);
  }
  else if (ExtensionFrame::StartHighlight(url,highlight,m_settings))
  {
  }
  else
    ::MessageBeep(MB_ICONASTERISK);
}

void ProjectFrame::OnDocLink(const wchar_t* url, TabInterface* from)
{
  // Select the panel to show the documentation in
  int thisPanel = 1;
  if (GetPanel(0)->ContainsTab(from))
    thisPanel = 0;

  // Show the source tab
  ((TabDoc*)GetPanel(thisPanel)->GetTab(Panel::Tab_Doc))->Show(CString(url));
  GetPanel(thisPanel)->SetActiveTab(Panel::Tab_Doc);
}

void ProjectFrame::OnSettingsChange(TabSettings* changed)
{
  TabSettings* left = (TabSettings*)GetPanel(0)->GetTab(Panel::Tab_Settings);
  TabSettings* right = (TabSettings*)GetPanel(1)->GetTab(Panel::Tab_Settings);

  if (changed == left)
    right->UpdateFromSettings();
  else if (changed == right)
    left->UpdateFromSettings();
}

bool ProjectFrame::LoadToolBar(void)
{
  CToolBarCtrl& ctrl = m_toolBar.GetToolBarCtrl();

  // Set the button identifiers
  static const UINT buttons[] =
  {
    ID_PLAY_GO,
    ID_REPLAY_LAST,
    ID_PLAY_STOP,
    ID_RELEASE_GAME
  };
  m_toolBar.SetButtons(buttons,sizeof buttons/sizeof buttons[0]);

  // Set the size of the images
  int w = 32, h = 32;
  m_toolBar.SetSizes(CSize(w+8,h+7),CSize(w,h));

  // Load the images
  DWORD commonVer = theOS.GetDllVersion("comctl32.dll");
  if ((commonVer >= DLLVERSION(6,0)) && (theApp.GetColourDepth() >= 32))
  {
    // Use true colour for comctrl32 6.0 or higher
    TBADDBITMAP add;
    add.hInst = NULL;

    // Use true colour images
    add.nID = (UINT_PTR)theApp.GetCachedImage("Run")->GetSafeHandle();
    m_toolBar.SendMessage(TB_ADDBITMAP,1,(LPARAM)&add);
    add.nID = (UINT_PTR)theApp.GetCachedImage("Replay")->GetSafeHandle();
    m_toolBar.SendMessage(TB_ADDBITMAP,1,(LPARAM)&add);
    add.nID = (UINT_PTR)theApp.GetCachedImage("Stop")->GetSafeHandle();
    m_toolBar.SendMessage(TB_ADDBITMAP,1,(LPARAM)&add);
    add.nID = (UINT_PTR)theApp.GetCachedImage("Release")->GetSafeHandle();
    m_toolBar.SendMessage(TB_ADDBITMAP,1,(LPARAM)&add);
  }
  else
  {
    // Load the bitmaps
    HBITMAP enabled = (HBITMAP)::LoadImage(AfxGetResourceHandle(),
      MAKEINTRESOURCE(IDR_TBAR_ENABLED),IMAGE_BITMAP,0,0,
      LR_LOADMAP3DCOLORS|LR_LOADTRANSPARENT);
    HBITMAP disabled = (HBITMAP)::LoadImage(AfxGetResourceHandle(),
      MAKEINTRESOURCE(IDR_TBAR_DISABLED),IMAGE_BITMAP,0,0,
      LR_LOADMAP3DCOLORS|LR_LOADTRANSPARENT);

    // Create image lists
    HIMAGELIST enabledList = ::ImageList_Create(32,32,ILC_COLOR24,0,5);
    ::ImageList_Add(enabledList,enabled,0);
    HIMAGELIST disabledList = ::ImageList_Create(32,32,ILC_COLOR24,0,5);
    ::ImageList_Add(disabledList,disabled,0);

    // Add to the toolbar
    ctrl.SetImageList(CImageList::FromHandle(enabledList));
    ctrl.SetDisabledImageList(CImageList::FromHandle(disabledList));
  }

  // Add selective text for buttons
  if (SetToolbarText(m_toolBar))
    m_toolBar.SetButtonStyle(0,m_toolBar.GetButtonStyle(0)|BTNS_SHOWTEXT);

  return true;
}

bool ProjectFrame::LoadHelpBar(void)
{
  static const UINT buttons[] =
  {
    ID_HELP_INDEX
  };
  m_helpBar.SetButtons(buttons,sizeof buttons/sizeof buttons[0]);

  int w = 32, h = 32;
  m_helpBar.SetSizes(CSize(w+8,h+7),CSize(w,h));

  DWORD commonVer = theOS.GetDllVersion("comctl32.dll");
  if ((commonVer >= DLLVERSION(6,0)) && (theApp.GetColourDepth() >= 32))
  {
    // Use true colour for comctrl32 6.0 or higher
    TBADDBITMAP add;
    add.hInst = NULL;

    add.nID = (UINT_PTR)theApp.GetCachedImage("Index")->GetSafeHandle();
    m_helpBar.SendMessage(TB_ADDBITMAP,1,(LPARAM)&add);
  }
  else
  {
    HBITMAP enabled = (HBITMAP)::LoadImage(AfxGetResourceHandle(),
      MAKEINTRESOURCE(IDR_TBAR_ENABLED),IMAGE_BITMAP,0,0,
      LR_LOADMAP3DCOLORS|LR_LOADTRANSPARENT);
    HBITMAP disabled = (HBITMAP)::LoadImage(AfxGetResourceHandle(),
      MAKEINTRESOURCE(IDR_TBAR_DISABLED),IMAGE_BITMAP,0,0,
      LR_LOADMAP3DCOLORS|LR_LOADTRANSPARENT);

    HIMAGELIST enabledList = ::ImageList_Create(32,32,ILC_COLOR24,0,5);
    ::ImageList_Add(enabledList,enabled,0);
    for (int i = 0; i < 5; i++)
      ::ImageList_Remove(enabledList,0);

    HIMAGELIST disabledList = ::ImageList_Create(32,32,ILC_COLOR24,0,5);
    ::ImageList_Add(disabledList,disabled,0);
    for (int i = 0; i < 5; i++)
      ::ImageList_Remove(disabledList,0);

    m_helpBar.GetToolBarCtrl().SetImageList(
      CImageList::FromHandle(enabledList));
    m_helpBar.GetToolBarCtrl().SetDisabledImageList(
      CImageList::FromHandle(disabledList));
  }

  // Add text for buttons
  SetToolbarText(m_helpBar);
  return true;
}

bool ProjectFrame::SetToolbarText(CToolBar& toolbar)
{
  if (theOS.GetDllVersion("comctl32.dll") >= DLLVERSION(5,81)) // comctrl32 5.81 or higher
  {
    toolbar.GetToolBarCtrl().SetExtendedStyle(TBSTYLE_EX_MIXEDBUTTONS);

    for (int i = 0; i < toolbar.GetToolBarCtrl().GetButtonCount(); i++)
    {
      UINT id = toolbar.GetItemID(i);
      if (id != ID_SEPARATOR)
      {
        CString btnText, tipText;
        btnText.LoadString(id);
        AfxExtractSubString(tipText,btnText,1,'\n');
        toolbar.SetButtonText(i,tipText);
      }
    }
    return true;
  }
  return false;
}

CRect ProjectFrame::GetInitialSearchRect(void)
{
  // Determine the initial search window size and position
  CRect frameRect, btnRect;
  GetWindowRect(frameRect);
  m_searchBar.GetDlgItem(IDC_SEARCH_SOURCE)->GetWindowRect(btnRect);

  CRect searchRect(btnRect.left,btnRect.bottom+2,frameRect.right,0);
  searchRect.bottom = searchRect.top+(frameRect.Height()*3/8);
  return searchRect;
}
