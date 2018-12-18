@extends('layouts.app')

@section('page-title', trans('app.general_settings'))
@section('page-heading', trans('app.general_settings'))

@section('breadcrumbs')
    <li class="breadcrumb-item text-muted">
        @lang('app.settings')
    </li>
    <li class="breadcrumb-item active">
        @lang('app.general')
    </li>
@stop

@section('content')

@include('partials.messages')

{!! Form::open(['route' => 'addColumn', 'id' => 'general-settings-form']) !!}

<div class="row">
    <div class="col-md-8">
        <div class="card">
            <div class="card-body">

                <div class="form-group">
                    <label for="name">TableName</label>
                     <select class="form-control" name="tableName">
                         @foreach($tables as $table)
                            <option value="{{ $table->Tables_in_user_admin }}">{{ $table->Tables_in_user_admin }}</option>
                         @endforeach 
                    </select>
                </div>
                <div class="form-group">
                    <label for="name">ColumnName</label>
                    <input type="text" class="form-control" id="column_name"
                           name="columnName" value="">
                </div>
            </div>
        </div>
    </div>
</div>

<button type="submit" class="btn btn-primary">
    addClumn
</button>

{{ Form::close() }}
@stop