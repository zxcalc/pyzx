// Initial wiring: [11, 19, 9, 8, 13, 5, 1, 0, 15, 17, 7, 16, 6, 10, 2, 4, 3, 18, 14, 12]
// Resulting wiring: [11, 19, 9, 8, 13, 5, 1, 0, 15, 17, 7, 16, 6, 10, 2, 4, 3, 18, 14, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[11], q[10];
cx q[12], q[18];
cx q[6], q[7];
