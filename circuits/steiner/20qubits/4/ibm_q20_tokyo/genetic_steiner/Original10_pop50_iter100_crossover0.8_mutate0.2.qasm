// Initial wiring: [16, 15, 19, 3, 1, 17, 10, 0, 18, 7, 14, 12, 9, 4, 5, 2, 6, 11, 8, 13]
// Resulting wiring: [16, 15, 19, 3, 1, 17, 10, 0, 18, 7, 14, 12, 9, 4, 5, 2, 6, 11, 8, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[13];
cx q[18], q[11];
cx q[19], q[18];
cx q[13], q[14];
