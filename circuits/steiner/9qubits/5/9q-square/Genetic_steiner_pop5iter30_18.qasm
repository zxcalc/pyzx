// Initial wiring: [7, 5, 1, 2, 0, 4, 6, 3, 8]
// Resulting wiring: [7, 5, 1, 2, 0, 4, 6, 3, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[8];
cx q[7], q[6];
cx q[8], q[3];
cx q[7], q[8];
cx q[3], q[8];
cx q[3], q[2];
cx q[8], q[3];
cx q[7], q[8];
