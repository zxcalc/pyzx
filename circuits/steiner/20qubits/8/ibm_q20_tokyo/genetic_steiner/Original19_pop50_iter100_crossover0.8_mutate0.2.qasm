// Initial wiring: [10, 14, 17, 3, 16, 6, 5, 13, 0, 9, 1, 7, 19, 12, 8, 2, 11, 18, 15, 4]
// Resulting wiring: [10, 14, 17, 3, 16, 6, 5, 13, 0, 9, 1, 7, 19, 12, 8, 2, 11, 18, 15, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[12];
cx q[12], q[11];
cx q[17], q[16];
cx q[18], q[11];
cx q[17], q[18];
cx q[1], q[2];
