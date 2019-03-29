// Initial wiring: [9, 4, 0, 16, 5, 3, 12, 6, 10, 13, 1, 7, 19, 14, 17, 2, 8, 15, 18, 11]
// Resulting wiring: [9, 4, 0, 16, 5, 3, 12, 6, 10, 13, 1, 7, 19, 14, 17, 2, 8, 15, 18, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[11];
cx q[18], q[17];
cx q[18], q[19];
cx q[13], q[14];
cx q[6], q[12];
cx q[12], q[11];
