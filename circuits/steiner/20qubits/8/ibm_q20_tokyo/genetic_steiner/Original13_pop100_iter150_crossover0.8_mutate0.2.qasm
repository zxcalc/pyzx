// Initial wiring: [13, 3, 18, 1, 2, 6, 15, 5, 12, 11, 10, 19, 14, 4, 7, 0, 9, 8, 17, 16]
// Resulting wiring: [13, 3, 18, 1, 2, 6, 15, 5, 12, 11, 10, 19, 14, 4, 7, 0, 9, 8, 17, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[11], q[9];
cx q[12], q[6];
cx q[17], q[18];
cx q[12], q[13];
cx q[7], q[8];
cx q[6], q[7];
