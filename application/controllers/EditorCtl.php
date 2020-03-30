<?php
defined('BASEPATH') or exit('No direct script access allowed');

class EditorCtl extends CI_Controller
{

	public function index()
	{
		$data['username'] = $this->db->get_where('users', ['email' =>
		$this->session->userdata('email')])->row_array();
		echo 'Anda telah masuk sebagai Editor' . $data['username'];
		echo '         ';
		echo anchor('AccountCtl/logout', 'logout');
		$this->load->view('editor/BerandaEditor');
	}
}
