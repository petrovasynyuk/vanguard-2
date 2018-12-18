<?php

namespace Vanguard\Http\Controllers\Web;
use Vanguard\Http\Controllers\Controller;
use Vanguard\Repositories\Activity\ActivityRepository;
use Vanguard\Repositories\User\UserRepository;
use Vanguard\Support\Enum\UserStatus;
use Illuminate\Http\Request;
use Schema;
use DB;
use Illuminate\Database\Schema\Blueprint;

class DatabaseTableController extends Controller
{
  //   public function addColumn($sTable, $sColumn)
  //   {
		// Schema::table($sTable, function(Blueprint $table) use ($sColumn, &$fluent)
  //       {
  //           $fluent = $table->string($sColumn);
  //       });

  //       return response()->json($fluent);     
  //   }
	public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {	

 		  $tables = DB::select('SHOW TABLES'); // returns an array of stdObjects
    	return view('addColumn.index', compact('tables'));
    }

	public function addColumn(Request $request)
    {
    	$sTable = $request->tableName;
    	$sColumn = $request->columnName;
		  Schema::table($sTable, function(Blueprint $table) use ($sColumn, &$fluent)
        {
            $fluent = $table->string($sColumn);
            // $fluent = $table->integer($sColumn);

        });
      return redirect()->route('addCoumn.index');
    }
}