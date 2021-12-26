/// Support for doing something awesome.
///
/// More dartdocs go here.
library jenkins_remote_api;

import 'dart:async';
import 'dart:convert';
import 'dart:mirrors';
import 'package:xml/xml.dart';
import 'package:http/http.dart';
import 'package:http_auth/http_auth.dart';

part 'api/base_client.dart';
part 'api/remote_access_api.dart';

part 'auth/auth_base.dart';
part 'auth/auth_http.dart';

part 'model/all_view.dart';
part 'model/body.dart';
part 'model/branch_impl.dart';
part 'model/branch_impllinks.dart';
part 'model/branch_implpermissions.dart';
part 'model/cause_action.dart';
part 'model/cause_user_id_cause.dart';
part 'model/classes_by_class.dart';
part 'model/clock_difference.dart';
part 'model/computer_set.dart';
part 'model/default_crumb_issuer.dart';
part 'model/disk_space_monitor_descriptor_disk_space.dart';
part 'model/empty_change_log_set.dart';
part 'model/extension_class_container_impl1.dart';
part 'model/extension_class_container_impl1links.dart';
part 'model/extension_class_container_impl1map.dart';
part 'model/extension_class_impl.dart';
part 'model/extension_class_impllinks.dart';
part 'model/favorite_impl.dart';
part 'model/favorite_impllinks.dart';
part 'model/free_style_build.dart';
part 'model/free_style_project.dart';
part 'model/free_style_projectactions.dart';
part 'model/free_style_projecthealth_report.dart';
part 'model/generic_resource.dart';
part 'model/github_content.dart';
part 'model/github_file.dart';
part 'model/github_organization.dart';
part 'model/github_organizationlinks.dart';
part 'model/github_repositories.dart';
part 'model/github_repositorieslinks.dart';
part 'model/github_repository.dart';
part 'model/github_repositorylinks.dart';
part 'model/github_repositorypermissions.dart';
part 'model/github_respository_container.dart';
part 'model/github_respository_containerlinks.dart';
part 'model/github_scm.dart';
part 'model/github_scmlinks.dart';
part 'model/hudson.dart';
part 'model/hudson_master_computer.dart';
part 'model/hudson_master_computerexecutors.dart';
part 'model/hudson_master_computermonitor_data.dart';
part 'model/hudsonassigned_labels.dart';
part 'model/input_step_impl.dart';
part 'model/input_step_impllinks.dart';
part 'model/label1.dart';
part 'model/link.dart';
part 'model/list_view.dart';
part 'model/multibranch_pipeline.dart';
part 'model/null_scm.dart';
part 'model/organisation.dart';
part 'model/organisations.dart';
part 'model/pipeline.dart';
part 'model/pipeline_activities.dart';
part 'model/pipeline_activity.dart';
part 'model/pipeline_activityartifacts.dart';
part 'model/pipeline_branches.dart';
part 'model/pipeline_branchesitem.dart';
part 'model/pipeline_branchesitemlatest_run.dart';
part 'model/pipeline_branchesitempull_request.dart';
part 'model/pipeline_branchesitempull_requestlinks.dart';
part 'model/pipeline_folder_impl.dart';
part 'model/pipeline_impl.dart';
part 'model/pipeline_impllinks.dart';
part 'model/pipeline_queue.dart';
part 'model/pipeline_run.dart';
part 'model/pipeline_run_impl.dart';
part 'model/pipeline_run_impllinks.dart';
part 'model/pipeline_run_node.dart';
part 'model/pipeline_run_node_steps.dart';
part 'model/pipeline_run_nodeedges.dart';
part 'model/pipeline_run_nodes.dart';
part 'model/pipeline_run_steps.dart';
part 'model/pipeline_runartifacts.dart';
part 'model/pipeline_runs.dart';
part 'model/pipeline_step_impl.dart';
part 'model/pipeline_step_impllinks.dart';
part 'model/pipelinelatest_run.dart';
part 'model/pipelinelatest_runartifacts.dart';
part 'model/pipelines.dart';
part 'model/queue.dart';
part 'model/queue_blocked_item.dart';
part 'model/queue_item_impl.dart';
part 'model/queue_left_item.dart';
part 'model/response_time_monitor_data.dart';
part 'model/scm_organisations.dart';
part 'model/string_parameter_definition.dart';
part 'model/string_parameter_value.dart';
part 'model/swap_space_monitor_memory_usage2.dart';
part 'model/unlabeled_load_statistics.dart';
part 'model/user.dart';
part 'model/user_favorites.dart';
part 'model/users.dart';
