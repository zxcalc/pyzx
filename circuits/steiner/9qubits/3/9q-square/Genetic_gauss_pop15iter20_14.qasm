// Initial wiring: [0 1 3 2 5 7 6 4 8]
// Resulting wiring: [0 1 3 2 5 7 6 4 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[1], q[2];
cx q[8], q[7];
