//******************************************************************************
// displaytext.java:	Applet
//
//******************************************************************************
import java.applet.*;
import java.awt.*;

// This is a Java Applet Wizard-generated sample.
// <<< code added >>> comments mark the changes to the Wizard code.
// Search this file for the string "<<<" to find the modified code.

//==============================================================================
// Main Class for applet DisplayText
//
//==============================================================================
public class displaytext extends Applet
{
	// <<< Instance Variables >>>
	// The value of the text to be displayed by the applet
	String m_phrase;

	// The origin of the text to be displayed, centered
	int m_x;
	int m_y;
	// <<< end added code >>>

	// PARAMETER SUPPORT:
	//		Parameters allow an HTML author to pass information to the applet;
	// the HTML author specifies them using the <PARAM> tag within the <APPLET>
	// tag.  The following variables are used to store the values of the
	// parameters.
    //--------------------------------------------------------------------------

    // Members for applet parameters
    // <type>       <MemberVar>    = <Default Value>
    //--------------------------------------------------------------------------
	private String m_initialValue = "Hello World";

    // Parameter names.  To change a name of a parameter, you need only make
	// a single change.  Simply modify the value of the parameter string below.
    //--------------------------------------------------------------------------
	private final String PARAM_initialValue = "initialValue";

	// DisplayText Class Constructor
	//--------------------------------------------------------------------------
	public displaytext()
	{
		// TODO: Add constructor code here
	}

	// APPLET INFO SUPPORT:
	//		The getAppletInfo() method returns a string describing the applet's
	// author, copyright date, or miscellaneous information.
    //--------------------------------------------------------------------------
	public String getAppletInfo()
	{
		return "Name: DisplayText\r\n" +
		       "Author: Visual J++ Product Development Team\r\n" +
		       "Created with Microsoft Visual J++";
	}

	// PARAMETER SUPPORT
	//		The getParameterInfo() method returns an array of strings describing
	// the parameters understood by this applet.
	//
    // DisplayText Parameter Information:
    //  { "Name", "Type", "Description" },
    //--------------------------------------------------------------------------
	public String[][] getParameterInfo()
	{
		String[][] info =
		{
			{ PARAM_initialValue, "String", "Initial Text to Display" },
		};
		return info;		
	}

	// The init() method is called by the AWT when an applet is first loaded or
	// reloaded.  Override this method to perform whatever initialization your
	// applet needs, such as initializing data structures, loading images or
	// fonts, creating frame windows, setting the layout manager, or adding UI
	// components.
    //--------------------------------------------------------------------------
	public void init()
	{
		// PARAMETER SUPPORT
		//		The following code retrieves the value of each parameter
		// specified with the <PARAM> tag and stores it in a member
		// variable.
		//----------------------------------------------------------------------
		String param;

		// initialValue: Initial Text to Display
		//----------------------------------------------------------------------
		param = getParameter(PARAM_initialValue);
		if (param != null)
			m_initialValue = param;

        // If you use a ResourceWizard-generated "control creator" class to
        // arrange controls in your applet, you may want to call its
        // CreateControls() method from within this method. Remove the following
        // call to resize() before adding the call to CreateControls();
        // CreateControls() does its own resizing.
        //----------------------------------------------------------------------
		resize(600, 120);

		// TODO: Place additional initialization code here

		// <<< Additional initialization code >>>
		// Generate the Font for paint and for setText
		setFont(new Font("Helvetica", Font.BOLD, 80));

		// Set the display text to the initial value
		setText(m_initialValue);
		// <<< end added code >>>
	}

	// Place additional applet clean up code here.  destroy() is called when
	// when you applet is terminating and being unloaded.
	//-------------------------------------------------------------------------
	public void destroy()
	{
		// TODO: Place applet cleanup code here
	}

	// DisplayText Paint Handler
	//--------------------------------------------------------------------------
	public void paint(Graphics g)
	{
		// <<< new painting code >>>
		Font font = getFont();
		g.setFont(font);
		g.drawString(m_phrase, m_x, m_y);
		// <<< end modified code >>>
	}

	//		The start() method is called when the page containing the applet
	// first appears on the screen. The AppletWizard's initial implementation
	// of this method starts execution of the applet's thread.
	//--------------------------------------------------------------------------
	public void start()
	{
		// TODO: Place additional applet start code here
	}
	
	//		The stop() method is called when the page containing the applet is
	// no longer on the screen. The AppletWizard's initial implementation of
	// this method stops execution of the applet's thread.
	//--------------------------------------------------------------------------
	public void stop()
	{
	}

	// TODO: Place additional applet code here

	// <<< New Methods to be called by VBScript >>>
	// Set the display text to the specified value and compute the
	// location to display the text so it will be centered.
	public void setText(String string)
	{
		// set the display string
		m_phrase = string;

		// get the size of the display string
		Font font = getFont();
		Graphics g = getGraphics();
		g.setFont(font);
		FontMetrics fm = g.getFontMetrics();
		int height = fm.getHeight();
		int width = fm.stringWidth(m_phrase);

		// center the string (or left justify if it is too long)
		Dimension dim = size();
		m_x = ( dim.width - width) / 2;
		if (m_x < 0) m_x = 0;
		m_y = ( dim.height + height ) / 2 
			- fm.getLeading() - fm.getDescent() / 2;
		if (m_y > dim.height) m_x = dim.height;

		// force a repaint of the applet
		repaint();
	}

	// Reset the display text to the initial value
	public void resetText()
	{
		setText(m_initialValue);
	}
	// <<< end added code >>>

}
