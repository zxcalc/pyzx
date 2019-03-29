// Initial wiring: [15, 6, 5, 2, 14, 1, 10, 19, 7, 8, 11, 3, 13, 4, 12, 0, 16, 18, 9, 17]
// Resulting wiring: [15, 6, 5, 2, 14, 1, 10, 19, 7, 8, 11, 3, 13, 4, 12, 0, 16, 18, 9, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[12];
cx q[19], q[18];
cx q[18], q[12];
cx q[11], q[18];
cx q[7], q[12];
cx q[7], q[8];
cx q[4], q[5];
cx q[0], q[1];
