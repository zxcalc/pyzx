// Initial wiring: [0 3 4 1 2 5 7 6 8]
// Resulting wiring: [0 3 4 1 2 5 7 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[5], q[4];
cx q[2], q[1];
cx q[4], q[7];
