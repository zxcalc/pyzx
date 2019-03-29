// Initial wiring: [9, 15, 4, 16, 2, 12, 11, 1, 17, 5, 3, 18, 6, 0, 7, 10, 14, 19, 8, 13]
// Resulting wiring: [9, 15, 4, 16, 2, 12, 11, 1, 17, 5, 3, 18, 6, 0, 7, 10, 14, 19, 8, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[12];
cx q[9], q[10];
cx q[6], q[7];
cx q[5], q[6];
