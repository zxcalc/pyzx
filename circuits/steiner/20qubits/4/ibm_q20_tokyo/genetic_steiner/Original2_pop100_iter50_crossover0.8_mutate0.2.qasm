// Initial wiring: [8, 11, 9, 1, 15, 3, 10, 5, 14, 12, 6, 18, 13, 0, 17, 7, 2, 4, 19, 16]
// Resulting wiring: [8, 11, 9, 1, 15, 3, 10, 5, 14, 12, 6, 18, 13, 0, 17, 7, 2, 4, 19, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[11], q[8];
cx q[11], q[17];
cx q[1], q[7];
