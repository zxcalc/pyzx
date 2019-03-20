// Initial wiring: [0 4 2 8 5 1 6 7 3]
// Resulting wiring: [0 4 2 8 5 1 6 7 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[3], q[2];
cx q[5], q[4];
cx q[3], q[8];
cx q[7], q[6];
