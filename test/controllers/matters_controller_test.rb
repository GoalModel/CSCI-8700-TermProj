require 'test_helper'

class MattersControllerTest < ActionController::TestCase
  setup do
    @matter = matters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matter" do
    assert_difference('Matter.count') do
      post :create, matter: { acquired_date: @matter.acquired_date, amateur: @matter.amateur, artist_or_band: @matter.artist_or_band, description: @matter.description, format: @matter.format, lineage: @matter.lineage, loaned_date: @matter.loaned_date, loaned_to: @matter.loaned_to, location: @matter.location, name_or_type: @matter.name_or_type, notes: @matter.notes, released_date: @matter.released_date, title: @matter.title, track_list: @matter.track_list, upc_barcode: @matter.upc_barcode, value: @matter.value }
    end

    assert_redirected_to matter_path(assigns(:matter))
  end

  test "should show matter" do
    get :show, id: @matter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matter
    assert_response :success
  end

  test "should update matter" do
    patch :update, id: @matter, matter: { acquired_date: @matter.acquired_date, amateur: @matter.amateur, artist_or_band: @matter.artist_or_band, description: @matter.description, format: @matter.format, lineage: @matter.lineage, loaned_date: @matter.loaned_date, loaned_to: @matter.loaned_to, location: @matter.location, name_or_type: @matter.name_or_type, notes: @matter.notes, released_date: @matter.released_date, title: @matter.title, track_list: @matter.track_list, upc_barcode: @matter.upc_barcode, value: @matter.value }
    assert_redirected_to matter_path(assigns(:matter))
  end

  test "should destroy matter" do
    assert_difference('Matter.count', -1) do
      delete :destroy, id: @matter
    end

    assert_redirected_to matters_path
  end
end
