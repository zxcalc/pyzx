// Initial wiring: [9, 13, 3, 8, 19, 6, 11, 7, 10, 1, 2, 0, 4, 16, 5, 14, 17, 12, 18, 15]
// Resulting wiring: [9, 13, 3, 8, 19, 6, 11, 7, 10, 1, 2, 0, 4, 16, 5, 14, 17, 12, 18, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[8], q[1];
cx q[11], q[9];
cx q[12], q[7];
cx q[18], q[12];
cx q[18], q[11];
cx q[10], q[11];
cx q[7], q[13];
