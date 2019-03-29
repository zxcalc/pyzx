// Initial wiring: [17, 10, 5, 12, 6, 16, 7, 15, 1, 19, 4, 13, 9, 18, 0, 8, 14, 11, 3, 2]
// Resulting wiring: [17, 10, 5, 12, 6, 16, 7, 15, 1, 19, 4, 13, 9, 18, 0, 8, 14, 11, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[8], q[2];
cx q[13], q[12];
cx q[17], q[12];
