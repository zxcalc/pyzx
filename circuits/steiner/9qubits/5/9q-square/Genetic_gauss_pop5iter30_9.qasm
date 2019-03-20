// Initial wiring: [0 1 3 4 2 5 7 6 8]
// Resulting wiring: [0 1 3 4 2 5 8 6 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[3], q[8];
cx q[0], q[1];
cx q[5], q[4];
cx q[3], q[2];
