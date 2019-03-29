// Initial wiring: [6, 14, 17, 15, 11, 0, 19, 5, 10, 8, 2, 7, 13, 16, 9, 3, 12, 4, 18, 1]
// Resulting wiring: [6, 14, 17, 15, 11, 0, 19, 5, 10, 8, 2, 7, 13, 16, 9, 3, 12, 4, 18, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[9], q[0];
cx q[14], q[13];
cx q[19], q[18];
cx q[11], q[12];
cx q[0], q[1];
