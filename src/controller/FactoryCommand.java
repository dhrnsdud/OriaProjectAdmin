package controller;

public class FactoryCommand {
		private FactoryCommand(){}
		private static FactoryCommand instance = new FactoryCommand();
		public static FactoryCommand getInstance(){
			return instance;
		}
		
		public ICommand createCommand(String cmd){
			if(cmd.equals("REGISTER")){
				return new RegProcCommand();
			}
			else if(cmd.equals("REGI_FORM")){
					return new RegFormCommand();
			}
			else if(cmd.equals("FOODBOARD")){
				return new FoodBoardCommand();
			}
			else if(cmd.equals("LOGIN")){
				return new LogInCommand();
			}
			else if(cmd.equals("LOGOUT")){
				return new LogOutCommand();
			}
			else if(cmd.equals("FREEBOARDPOST")){
				return new FreeBoardPostCommand();
			}
			else if(cmd.equals("FREEBOARDLIST")){
				return new FreeBoardListCommand();
			}
			else if(cmd.equals("FREEBOARDINSERT")){
	            return new FreeBoardPostProcCommand();
	         }
			else if(cmd.equals("FREEBOARDREAD")){
				return new FreeBoardReadCommand();
			}
			else if(cmd.equals("FREEBOARDUPDATE")){
				return new FreeBoardUdateCommand();
			}
			else if(cmd.equals("FREEBOARDREPLY")){
				return new FreeBoardReplyCommand();
			}
			else if(cmd.equals("FREEBOARDDELETE")){
				return new FreeBoardDeleteCommand();
			}
			else if(cmd.equals("FREEBOARDBACK")){
				return new FreeBoardReadBackCommand();
			}
			else if(cmd.equals("FREEBORADUPDATEPROC")){
				return new FreeBoardUpdateProcCommand();
			}
			else if(cmd.equals("FREEBOARDDELETEPROC")){
				return new FreeBoardDeleteProcCommand();
			}
			
			else if(cmd.equals("GONGJIBOARDPOST")){
				return new GongjiBoardPostCommand();
			}
			else if(cmd.equals("GONGJIBOARDLIST")){
				return new GongjiBoardListCommand();
			}
			else if(cmd.equals("GONGJIBOARDINSERT")){
	            return new GongjiBoardPostProcCommand();
	         }
			else if(cmd.equals("GONGJIBOARDREAD")){
				return new GongjiBoardReadCommand();
			}
			else if(cmd.equals("GONGJIBOARDUPDATE")){
				return new GongjiBoardUpdateCommand();
			}
			else if(cmd.equals("GONGJIBOARDDELETE")){
				return new GongjiBoardDeleteCommand();
			}
			else if(cmd.equals("GONGJIBOARDBACK")){
				return new GongjiBoardReadBackCommand();
			}
			else if(cmd.equals("GONGJIBORADUPDATEPROC")){
				return new GongjiBoardUpdateProcCommand();
			}
			else if(cmd.equals("GONGJIBOARDDELETEPROC")){
				return new GongjiBoardDeleteProcCommand();
			}
			else if(cmd.equals("MAIN")){
				return new MainCommand();
			}
			else if(cmd.equals("MADE")){
				return new MadeCommand();
			}	
			else if(cmd.equals("MAINSEARCH")){
	            return new MainSearchCommand();
	         }
			else if(cmd.equals("REGISTEREDIT")){
	            return new RegisterEditCommand();
	         }
			else if(cmd.equals("reservation")){
	            return new ReservationCommand();
	         }
	         else if(cmd.equals("AREAFOODBOARD")){
	            return new AreaFoodBoardCommand();
	         }
	         else if(cmd.equals("TYPEFOODBOARD")){
	            return new TypeFoodBoardCommand();
	         }
	         else if(cmd.equals("GONGJISEARCH")){
	               return new GongjiBoardSearchCommand();
	            }
	         else if(cmd.equals("FREEBOARDSEARCH")){
	            return new FreeBoardSearchCommand();
	         }
	         else if(cmd.equals("REGIADMIN")){
		            return new RegiAdminCommand();
		       }
	         else if(cmd.equals("REGISTERDELETE")){
		            return new RegisterDeleteCommand();
		       }
	         else if(cmd.equals("BUSINESSDELETE")){
		            return new BusinessDeleteCommand();
		       }
	         else if(cmd.equals("BUSINESSEDIT")){
		            return new BusinessEditCommand();
		       }
			
		
					
	/*		else if(cmd.equals("MAIN")){
				return new MainCommand();
			}*/
			return null;
		}
}
