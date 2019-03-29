// Initial wiring: [16, 10, 1, 11, 5, 15, 6, 14, 18, 12, 8, 0, 13, 4, 19, 7, 2, 3, 9, 17]
// Resulting wiring: [16, 10, 1, 11, 5, 15, 6, 14, 18, 12, 8, 0, 13, 4, 19, 7, 2, 3, 9, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[13];
cx q[19], q[18];
cx q[18], q[12];
cx q[17], q[18];
cx q[14], q[15];
cx q[5], q[6];
