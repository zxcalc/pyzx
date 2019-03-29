// Initial wiring: [8, 18, 6, 4, 3, 12, 17, 0, 11, 9, 19, 2, 5, 16, 14, 10, 13, 1, 15, 7]
// Resulting wiring: [8, 18, 6, 4, 3, 12, 17, 0, 11, 9, 19, 2, 5, 16, 14, 10, 13, 1, 15, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[11];
cx q[13], q[7];
cx q[18], q[17];
cx q[13], q[15];
