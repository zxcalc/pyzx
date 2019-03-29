// Initial wiring: [3, 11, 15, 12, 4, 9, 7, 5, 6, 0, 19, 16, 14, 8, 10, 18, 1, 2, 17, 13]
// Resulting wiring: [3, 11, 15, 12, 4, 9, 7, 5, 6, 0, 19, 16, 14, 8, 10, 18, 1, 2, 17, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[11], q[10];
cx q[14], q[13];
cx q[6], q[13];
