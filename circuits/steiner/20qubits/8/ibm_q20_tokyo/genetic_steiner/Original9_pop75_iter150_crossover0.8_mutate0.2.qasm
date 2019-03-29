// Initial wiring: [19, 8, 9, 2, 14, 3, 10, 5, 17, 4, 12, 13, 11, 7, 6, 18, 1, 15, 16, 0]
// Resulting wiring: [19, 8, 9, 2, 14, 3, 10, 5, 17, 4, 12, 13, 11, 7, 6, 18, 1, 15, 16, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[7];
cx q[16], q[13];
cx q[19], q[18];
cx q[18], q[11];
cx q[11], q[8];
cx q[17], q[18];
cx q[13], q[14];
cx q[2], q[7];
