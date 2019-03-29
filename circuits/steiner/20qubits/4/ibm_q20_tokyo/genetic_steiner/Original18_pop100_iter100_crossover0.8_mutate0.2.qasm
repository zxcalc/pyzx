// Initial wiring: [18, 15, 0, 11, 14, 8, 17, 12, 19, 13, 6, 3, 10, 2, 7, 16, 1, 9, 4, 5]
// Resulting wiring: [18, 15, 0, 11, 14, 8, 17, 12, 19, 13, 6, 3, 10, 2, 7, 16, 1, 9, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[5], q[3];
cx q[14], q[13];
cx q[11], q[18];
