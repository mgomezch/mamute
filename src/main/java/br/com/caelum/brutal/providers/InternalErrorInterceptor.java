package br.com.caelum.brutal.providers;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.resource.ResourceMethod;

@Component
@Intercepts(before=GlobalInterceptor.class)
public class InternalErrorInterceptor implements Interceptor{
	
	private final Result result;

	public InternalErrorInterceptor(Result result) {
		this.result = result;
	}

	@Override
	public boolean accepts(ResourceMethod arg0) {
		return true;
	}

	@Override
	public void intercept(InterceptorStack stack, ResourceMethod method,
			Object instance) throws InterceptionException {
		try {
			stack.next(method, instance);
		}catch (Exception e) {
			
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			
			
			Throwable cause = e.getCause();
			e.printStackTrace(pw);
			pw.printf("\n");
			
			if (cause instanceof ConstraintViolationException) {
				Set<ConstraintViolation<?>> constraintViolations = ((ConstraintViolationException) cause).getConstraintViolations();
				pw.printf("Constraint Violations: \n");
				for (ConstraintViolation<?> constraintViolation : constraintViolations) {
					pw.printf("\t" +constraintViolation.getConstraintDescriptor().getAnnotation()+"\n");
				}
			}
			
			pw.close();
			result.include("stacktrace", sw.toString());
			throw e;
		}
	}
}