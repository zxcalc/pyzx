// Initial wiring: [16, 10, 2, 7, 17, 12, 6, 1, 3, 8, 9, 5, 19, 14, 18, 4, 0, 11, 15, 13]
// Resulting wiring: [16, 10, 2, 7, 17, 12, 6, 1, 3, 8, 9, 5, 19, 14, 18, 4, 0, 11, 15, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[8], q[7];
cx q[7], q[6];
cx q[13], q[12];
cx q[14], q[13];
cx q[19], q[18];
cx q[3], q[6];
cx q[3], q[4];
