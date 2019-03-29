// Initial wiring: [13, 3, 10, 17, 14, 16, 5, 11, 9, 7, 19, 15, 18, 4, 2, 1, 8, 6, 0, 12]
// Resulting wiring: [13, 3, 10, 17, 14, 16, 5, 11, 9, 7, 19, 15, 18, 4, 2, 1, 8, 6, 0, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[11], q[9];
cx q[12], q[11];
cx q[12], q[7];
cx q[19], q[10];
cx q[10], q[9];
