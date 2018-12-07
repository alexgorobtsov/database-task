package DepInjection;

import java.lang.reflect.Field;

public final class Injector {

    public static <T> T inject(T object, Object injectible) {
        final Field[] declaredFields = object.getClass().getDeclaredFields();
        final Class injectibleClass = injectible.getClass();

        boolean injected = false;

        for (Field field : declaredFields) {

            if (!field.getType().isAssignableFrom(injectibleClass)) {
                continue;
            }

            field.setAccessible(true);

            try {
                field.set(object, injectible);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }

            field.setAccessible(false);
        }

        return object;
    }
}
