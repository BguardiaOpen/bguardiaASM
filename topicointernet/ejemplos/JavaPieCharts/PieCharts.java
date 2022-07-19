//******************************************************************************
// PieCharts.java:	Applet
//
//******************************************************************************
import java.applet.*;
import java.awt.*;

//==============================================================================
// Main Class for applet PieCharts
//
//==============================================================================
public class PieCharts extends Applet
{
	// PARAMETER SUPPORT:
	//		Parameters allow an HTML author to pass information to the applet;
	// the HTML author specifies them using the <PARAM> tag within the <APPLET>
	// tag.  The following variables are used to store the values of the
	// parameters.
    //--------------------------------------------------------------------------

    // Members for applet parameters
    // <type>       <MemberVar>    = <Default Value>
    //--------------------------------------------------------------------------
	private String m_Leyenda = "";
	private String m_Porcientos = "";
	private String m_Colores = "";
	private String m_Posicion = "";
	private String m_Radio = "";

	// Variables ya analizadas
	private int		NumRebanadas;
	private String	Leyendas[];
	private Color	Colores[];
	private int		Porcentajes[];
	private int		X=200, Y=200;
	private int		Radio=200;

    // Parameter names.  To change a name of a parameter, you need only make
	// a single change.  Simply modify the value of the parameter string below.
    //--------------------------------------------------------------------------
	private final String PARAM_Leyenda = "Leyenda";
	private final String PARAM_Porcientos = "Porcientos";
	private final String PARAM_Colores = "Colores";
	private final String PARAM_Posicion = "Posicion";
	private final String PARAM_Radio = "Radio";

	// PieCharts Class Constructor
	//--------------------------------------------------------------------------
	public PieCharts()
	{
		// TODO: Add constructor code here
	}

	// APPLET INFO SUPPORT:
	//		The getAppletInfo() method returns a string describing the applet's
	// author, copyright date, or miscellaneous information.
    //--------------------------------------------------------------------------
	public String getAppletInfo()
	{
		return "Name: JavaPieCharts\r\n" +
		       "Author: Bruno Guardia Robles\r\n" +
		       "Created with Microsoft Visual J++ Version 1.1";
	}

	// PARAMETER SUPPORT
	//		The getParameterInfo() method returns an array of strings describing
	// the parameters understood by this applet.
	//
    // PieCharts Parameter Information:
    //  { "Name", "Type", "Description" },
    //--------------------------------------------------------------------------
	public String[][] getParameterInfo()
	{
		String[][] info =
		{
			{ PARAM_Leyenda, "String", "Leyenda de cada rebanada" },
			{ PARAM_Porcientos, "String", "Porcentajes enteros para cada rebanada" },
			{ PARAM_Colores, "String", "Códigos hexadecimales de los colores para cada rebanada" },
			{ PARAM_Posicion, "String", "Centro de la gráfica de Pie" },
			{ PARAM_Radio, "String", "Radio de la gráfica de Pie" },
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

		// Leyenda: Parameter description
		//----------------------------------------------------------------------
		param = getParameter(PARAM_Leyenda);
		if (param != null)
			m_Leyenda = param;

		// Porcientos: Parameter description
		//----------------------------------------------------------------------
		param = getParameter(PARAM_Porcientos);
		if (param != null)
			m_Porcientos = param;

		// Colores: Parameter description
		//----------------------------------------------------------------------
		param = getParameter(PARAM_Colores);
		if (param != null)
			m_Colores = param;

		// Posicion: Parameter description
		//----------------------------------------------------------------------
		param = getParameter(PARAM_Posicion);
		if (param != null)
			m_Posicion = param;

		// Colores: Parameter description
		//----------------------------------------------------------------------
		param = getParameter(PARAM_Radio);
		if (param != null)
			m_Radio = param;

        // If you use a ResourceWizard-generated "control creator" class to
        // arrange controls in your applet, you may want to call its
        // CreateControls() method from within this method. Remove the following
        // call to resize() before adding the call to CreateControls();
        // CreateControls() does its own resizing.
        //----------------------------------------------------------------------
    	resize(600, 400);

		// TODO: Place additional initialization code here
		NumRebanadas = ObtenLeyenda();
		NumRebanadas = ObtenPorcentajes();
		NumRebanadas = ObtenColor();			
		ObtenPosicion();
	}

	// Place additional applet clean up code here.  destroy() is called when
	// when you applet is terminating and being unloaded.
	//-------------------------------------------------------------------------
	public void destroy()
	{
		// TODO: Place applet cleanup code here
	}

	// PieCharts Paint Handler
	//--------------------------------------------------------------------------
	public void paint(Graphics g)
	{
		int	i, startAngle, endAngle;

		startAngle = 0;
		for ( i = 0; i < NumRebanadas; i++)
		{
			endAngle = ( Porcentajes[i]*360)/100;
			g.setColor ( Colores[i] );
			// Rebanada del pie
			g.fillArc( X, Y, Radio, Radio, startAngle, endAngle );
			// Leyenda
			g.fillRect ( 480, 20 + 30*i, 15, 10 );
			g.setColor ( Color.black );
			g.drawString ( Leyendas[i], 500, 30 + 30 * i );
			startAngle = startAngle + endAngle;
		}
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
	// Método que divide un string en tokens, de acuerdo a la cadena...
	private int CuentaPalabras(String S, char C)
	{
		int	Cuenta=0, Temp, Temp2;
		// Recorrer la cadena buscando espacios
		Temp=S.indexOf(C);

		if ( Temp> 0 ) { // Hay más de uno
			// Para contar, hay que recorrer
			Cuenta++;
			while (Temp>0) {
				Temp=S.indexOf(C, Temp+1 );
				Cuenta++;
			}
		}
		else {
			// Convertir a numérico y listo
			Cuenta=1;
		}
		return Cuenta;
	}

	private int ObtenLeyenda()
	{
		int	NumElementos, i, Temp, Temp2;

		NumElementos = CuentaPalabras(m_Leyenda, ',');

		Leyendas = new String[NumElementos];

		Temp2 = 0;
		for (i = 0; i < NumElementos; i++ )
		{
			Temp=m_Leyenda.indexOf(',', Temp2);
			if ( Temp > 0 )
				Leyendas[i] = m_Leyenda.substring(Temp2, Temp);
			else
				Leyendas[i] = m_Leyenda.substring(Temp2);
			Temp2 = Temp + 1;
		}

		return	NumElementos;
	}

	private int ObtenPorcentajes()
	{
		int	NumElementos, i, Temp, Temp2;

		NumElementos = CuentaPalabras(m_Porcientos, ',');

		Porcentajes = new int[NumElementos];

		Temp2 = 0;
		for (i = 0; i < NumElementos; i++ )
		{
			Temp=m_Porcientos.indexOf(',', Temp2);
			if ( Temp > 0 )
				Porcentajes[i] = Integer.valueOf(m_Porcientos.substring(Temp2, Temp)).intValue();
			else
				Porcentajes[i] = Integer.valueOf(m_Porcientos.substring(Temp2)).intValue();
			Temp2 = Temp + 1;
		}

		return	NumElementos;
	}

	private int ObtenColor()
	{
		int	NumElementos, i, Temp, Temp2;
		int Temporal;

		NumElementos = CuentaPalabras(m_Colores, ',');

		Colores = new Color[NumElementos];

		Temp2 = 0;
		for (i = 0; i < NumElementos; i++ )
		{
			Temp=m_Colores.indexOf(',', Temp2);
			// Se usa hexadecimal para representar el color
			if ( Temp > 0 )
				Temporal = Integer.valueOf(m_Colores.substring(Temp2, Temp),16).intValue();
			else
				Temporal = Integer.valueOf(m_Colores.substring(Temp2),16).intValue();
			Colores[i] = new Color(Temporal);			
			Temp2 = Temp + 1;
		}

		return	NumElementos;
	}

	private void ObtenPosicion()
	{
		int	NumElementos, i, Temp, Temp2;

		Temp=m_Posicion.indexOf(',');
		X = Integer.valueOf(m_Posicion.substring(0, Temp)).intValue();
		Y = Integer.valueOf(m_Posicion.substring(Temp+1)).intValue();

		Radio = Integer.valueOf(m_Radio).intValue();
	}


}
