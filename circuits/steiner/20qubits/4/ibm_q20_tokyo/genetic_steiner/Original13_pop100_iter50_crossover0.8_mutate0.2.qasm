// Initial wiring: [15, 4, 7, 2, 6, 16, 1, 17, 19, 9, 12, 18, 8, 3, 10, 0, 14, 5, 13, 11]
// Resulting wiring: [15, 4, 7, 2, 6, 16, 1, 17, 19, 9, 12, 18, 8, 3, 10, 0, 14, 5, 13, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[16], q[13];
cx q[12], q[18];
cx q[11], q[18];
