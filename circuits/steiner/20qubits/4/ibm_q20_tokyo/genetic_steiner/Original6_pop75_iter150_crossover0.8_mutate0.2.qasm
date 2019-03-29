// Initial wiring: [17, 16, 8, 14, 4, 11, 6, 5, 9, 10, 12, 19, 2, 18, 7, 1, 13, 0, 3, 15]
// Resulting wiring: [17, 16, 8, 14, 4, 11, 6, 5, 9, 10, 12, 19, 2, 18, 7, 1, 13, 0, 3, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[6], q[3];
cx q[13], q[14];
cx q[6], q[7];
